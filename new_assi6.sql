// 1. Create a collection named books.
db.createCollection("books");           // small c works

// 2. Insert 5 records with fields TITLE, DESCRIPTION, BY, URL, TAGS, AND LIKES
db.books.insertMany([
    {
        TITLE: 'MongoDB Basics',
        DESCRIPTION: 'Introduction to MongoDB',
        BY: 'John',
        URL: 'https://example.com/mongodb-basics',
        TAGS: ['NoSQL', 'Database'],
        LIKES: 15
    },
    {
        TITLE: 'MongoDB Advanced',
        DESCRIPTION: 'Advanced features of MongoDB',
        BY: 'Alice',
        URL: 'https://example.com/mongodb-advanced',
        TAGS: ['NoSQL', 'Database'],
        LIKES: 20
    },
    {
        TITLE: 'Learning MongoDB',
        DESCRIPTION: 'A guide to learning MongoDB',
        BY: 'John',
        URL: 'https://example.com/learning-mongodb',
        TAGS: ['NoSQL', 'Tutorial'],
        LIKES: 12
    },
    {
        TITLE: 'MongoDB Tips and Tricks',
        DESCRIPTION: 'Useful tips for working with MongoDB',
        BY: 'Bob',
        URL: 'https://example.com/mongodb-tips',
        TAGS: ['NoSQL', 'Tips'],
        LIKES: 8
    },
    {
        TITLE: 'MongoDB in Practice',
        DESCRIPTION: 'Real-world applications of MongoDB',
        BY: 'Jane',
        URL: 'https://example.com/mongodb-practice',
        TAGS: ['NoSQL', 'Applications'],
        LIKES: 25
    }
]);

// 3. Insert 1 more document in the collection with an additional field of user name and comments.
db.books.insertOne({
    TITLE: 'MongoDB Best Practices',
    DESCRIPTION: 'Best practices for MongoDB development',
    BY: 'John',
    URL: 'https://example.com/mongodb-best-practices',
    TAGS: ['NoSQL', 'Best Practices'],
    LIKES: 18,
    USER_NAME: 'Alice',
    COMMENTS: ['Great book!', 'Very informative.']
});

// 4. Display all documents whose title is 'mongodb'.
db.books.find({ TITLE: 'MongoDB Basics' });

// 5. Display all documents written by 'john' or whose title is 'mongodb'.
db.books.find({ $or: [{ BY: 'John' }, { TITLE: 'MongoDB' }] });

// 6. Display all documents whose title is 'mongodb' and written by 'john'.
db.books.find({ TITLE: 'MongoDB Basics', BY: 'John' });

// 7. Display all documents whose likes are greater than 10.
db.books.find({ LIKES: { $gt: 10 } });

// 8. Display the second document published by 'john'.
db.books.find({ BY: 'John' }).skip(1).limit(1);

// 9. Display all books in sorted fashion.
db.books.find().sort({ TITLE: 1 }); // Ascending order by title

// 10. Find the average number of likes of the books published by john.
db.books.aggregate([
    { $match: { BY: 'John' } },
    { $group: { _id: null, avgLikes: { $avg: '$LIKES' } } }
]);

// 11. Find the first and last book published by john.
db.books.find({ BY: 'John' }).sort({ TITLE: 1 }).limit(1); // First book
db.books.find({ BY: 'John' }).sort({ TITLE: -1 }).limit(1); // Last book
