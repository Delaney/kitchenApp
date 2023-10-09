
/*
i'll most likely end up replicating the getAllFromDatabase function across all tables, 
I could just add the table name as a parameter in future
*/

const getAllFromDatabase = async (pool) => { 
    const client = await pool.connect();  
    var result;
    try {
        result = await client.query(
            'SELECT * FROM categories'
        );
    } catch (error) {
        //throw it back to the calling function 
        throw error; //how to handle specific types of errors? Probably in future iteration
    };
    const categories = result.rows;
    client.release();
    // console.log("Categories from Database function is: ", categories); //test
    return categories; 
}

module.exports = { getAllFromDatabase };

