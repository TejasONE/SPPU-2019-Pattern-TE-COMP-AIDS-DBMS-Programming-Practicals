// 1. Create a collection named books.
db.createCollection("books");

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

// 7. Update the title of 'mongodb' document to 'mongodb overview'.
db.books.updateOne({ TITLE: 'MongoDB Basics' }, { $set: { TITLE: 'MongoDB Overview' } });

// 8. Delete the document titled 'nosql overview'.
db.books.deleteOne({ TITLE: 'NoSQL Overview' });

// 9. Display exactly two documents written by 'john'.
db.books.find({ BY: 'John' }).limit(2);

// 10. Create an index on the author name.
db.books.createIndex({ BY: 1 });

// Display the books published by john and check if it uses the index which we have created
db.books.find({ BY: 'John' }).explain("executionStats");

// 11. Find the number of books published by john.
db.books.find({ BY: 'John' }).count();
