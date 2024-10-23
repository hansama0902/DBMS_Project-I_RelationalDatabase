const express = require('express');
const router = express.Router();
const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database('dbConnector_Sqlite.db')

/* GET home page. */
router.get('/', async function(req, res) {
  // res.render('index', { title: 'Express' });
  res.redirect("/Patient");

});
// http://localhost:3000/references?pageSize=24&page=3&q=John
router.get("/Patient", async (req, res, next) => {
  const query = req.query.q || "";
  const page = +req.query.page || 1;
  const pageSize = +req.query.pageSize || 24;
  const msg = req.query.msg || null;
  try {
    // let total = await db.getPatientsCount(query);
    let references = await db.getPatients(query, page, pageSize);


    res.render("./pages/index", {
      references,
      query,
      msg,
      currentPage: page,
      lastPage: Math.ceil(total / pageSize),
    });
  } catch (err) {
    next(err);
  }
});

module.exports = router;

