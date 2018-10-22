var post = {
  title: 'Lorem ipsum dolor sit amet',
  published: 'April 1, 2015',
  body: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.'
};

var post2 = {
  title: 'Consectetur adipiscing elit',
  published: 'October, 21, 2018',
  body: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
}

post.body = '<p>' + post.body + '</p>';
post2.body = '<p>' + post2.body + '</p>';
post.tags = ['Food', 'Cooking', 'Vegetables'];

var posts = [post, post2];

Handlebars.registerPartial('tag', $('#tag').html());

var postsTemplate = Handlebars.compile(document.getElementById('posts').innerHTML);


$('body').append(postsTemplate({posts: post}));
