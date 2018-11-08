var post = {
  title: 'My title!',
  published: 'November 8, 2018',
  body: 'Check out my body',
};

var posts = [
  {
    title: 'My second title!',
    published: 'November 9, 2018',
    body: 'Even better body',
  },
]

posts.push(post);

post.body = '<p>' + post.body + '</p>';
post.tags = ['fun', 'hobby', 'racy'];

Handlebars.registerPartial('tag', $('#tag').html());

var postsTemplate = Handlebars.compile(document.getElementById('posts').innerHTML);

$('body').append(postsTemplate({ posts: posts }));
