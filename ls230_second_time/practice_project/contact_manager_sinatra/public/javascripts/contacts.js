$(function() {
  const mainpageHandlebar = Handlebars.compile($('#mainpageHandlebar').html());
  const createContactHandlebar = Handlebars.compile($('#createContactHandlebar').html());
  const editContactHandlebar = Handlebars.compile($('#editContactHandlebar').html());
  const tagListHandlebar = Handlebars.compile($('#tagListHandlebar').html())
  const singleContactHandlebar = Handlebars.compile($('#singleContactHandlebar').html());
  Handlebars.registerPartial('singleContactHandlebar', $('#singleContactHandlebar').html());
  var uniqueTags = [];
  var filteredTags;

  var ui = {
    renderCreateContact: function() {
      $('main').html(createContactHandlebar()).hide().slideDown(600);
    },

    renderMainpage: function(data) {
      $('main').html(mainpageHandlebar({ contacts: data })).hide().slideDown(600);
      $('main').append(tagListHandlebar({ uniqueTags: uniqueTags })).hide().slideDown(800);
    },

    renderEditContact: function(data) {
      $('main').html(editContactHandlebar(data)).hide().slideDown(600);
    },

    renderFilteredContacts: function(data) {
      $('#mainpage').html(mainpageHandlebar({ contacts: data }))
    }
  };

  var api = {
    registerContact: function(e) {
      var request = new XMLHttpRequest();
      var json;
      request.open('POST', 'http://localhost:4567/api/contacts');
      request.setRequestHeader('Content-Type', 'application/json');

      var data = {
        'full_name': $('#fullName').val(),
        'email': $('#email').val(),
        'phone_number': $('#phone').val(),
        'tags': $('#tags').val(),
      };

      json = JSON.stringify(data);
      request.send(json);

      $(request).on('load', function() {
        if (request.status === 201) {
          api.getAllContacts();
        }
      });
    },

    updateContact: function(e) {
      var id = $(e.target).attr('data-id');
      var request = new XMLHttpRequest();
      var json;
      request.open('PUT', `http://localhost:4567/api/contacts/${id}`);
      request.setRequestHeader('Content-Type', 'application/json');

      var data = {
        'full_name': $('#fullName').val(),
        'email': $('#email').val(),
        'phone_number': $('#phone').val(),
        'tags': $('#tags').val(),
      };

      json = JSON.stringify(data);
      request.send(json);

      $(request).on('load', function() {
        if (request.status === 201) {
          api.getAllContacts();
        }
      });
    },

    getAllContacts: function() {
      var request = new XMLHttpRequest();
      request.open('GET', 'http://localhost:4567/api/contacts');

      request.addEventListener('load', function(event) {
        var data = JSON.parse(request.response);
        app.populateUniqueTags(data);
        ui.renderMainpage(data);
      });

      request.send();
    },

    getFilteredContacts: function(e) {
      var request = new XMLHttpRequest();
      app.populateFilteredTags(e);
      request.open('GET', 'http://localhost:4567/api/contacts');

      request.addEventListener('load', function(event) {
        var data = JSON.parse(request.response);


        if ($('[type="checkbox"]:checked').length !== 0) {
          data = app.filterContactListByTags(data);
        }

        ui.renderFilteredContacts(data);
      });

      request.send();
    },

    getSingleContact: function(e) {
      var id = $(e.target).attr('data-id');
      var request = new XMLHttpRequest();
      request.open('GET', `http://localhost:4567/api/contacts/${id}`);

      request.addEventListener('load', function(event) {
        var data = JSON.parse(request.response);
        ui.renderEditContact(data);
      });

      request.send();
    },

    deleteContact: function(e) {
      var id = $(e.target).attr('data-id');
      var request = new XMLHttpRequest();

      if (window.confirm("Are you sure you want to delete this contact?")) {
        request.open('DELETE', `http://localhost:4567//api/contacts/${id}`);
        request.setRequestHeader('Content-Type', 'application/json');

        request.addEventListener('load', function(event) {
          if (request.status === 204) {
            api.getAllContacts();
          }
        });

        request.send();
      }
    },
  }

  var app = {
    populateUniqueTags: function(contacts) {
      var self = this;
      uniqueTags = [];

      contacts.forEach(function(contact) {
        if (contact['tags']) {
          self.addUniqueTags(contact['tags']);
        }
      });
    },

    trimTags: function(tagArray) {
      return tagArray.map(function (tag) {
        return tag.trim();
      });
    },

    addUniqueTags: function(newTags) {
      var tagArray = newTags.split(',');

      tagArray = this.trimTags(tagArray);

      tagArray.forEach(function (tag) {
        if (uniqueTags.indexOf(tag) === -1) {
          uniqueTags.push(tag);
        }
      });
    },

    populateFilteredTags: function(e) {
      var $checkedInputs = $('[type="checkbox"]:checked');
      var $checkboxes = $('[type="checkbox"]');

      filteredTags = [];

      if ($checkedInputs.length !== 0) {
        $checkedInputs.each(function() {
          filteredTags.push($(this).attr('id'));
        });
      } else {
        $checkboxes.each(function() {
          filteredTags.push($(this).attr('id'));
        });
      }
    },

    filterContactListByTags: function(contacts) {
      var self = this;

      return contacts.filter(function(contact) {
        if (contact.tags) {
          var tagArray = contact.tags.split(',');
          tagArray = self.trimTags(tagArray);

          return tagArray.some(function(tag) {
            return filteredTags.includes(tag);
          });
        } else {
          // not displaying contacts without tags
          return !!contact.tags;
        }
      });
    },

    searchContacts: function(e) {
      var searchTerm = $(e.target).val().toLowerCase();
      var $currentContacts = $('.contactInfo');
      var $this;
      var name;
      var searchLength = searchTerm.length;

      $currentContacts.each(function() {
        $this = $(this);
        name = $this.find('h4').text().toLowerCase();

        $this.hide();

        if (name.slice(0, searchLength) == searchTerm) {
          $this.show();
        }
      });
    },

    bindEvents: function() {
      $('main').on('click', '.addContact', ui.renderCreateContact.bind(this));
      $('main').on('click', '#submitNewContact', api.registerContact.bind(this));
      $('main').on('click', '.cancelContact', api.getAllContacts.bind(this));
      $('main').on('click', '.deleteButton', api.deleteContact.bind(this));
      $('main').on('click', '.editButton', api.getSingleContact.bind(this));
      $('main').on('click', '#submitEditContact', api.updateContact.bind(this));
      $('main').on('change', '[type="checkbox"]', api.getFilteredContacts.bind(this));
      $('main').on('keyup', '#searchbar', this.searchContacts.bind(this));
    },

    init: function() {
      api.getAllContacts();
      this.bindEvents();
    },
  };

  app.init();
});
