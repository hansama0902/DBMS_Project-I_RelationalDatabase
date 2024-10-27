// var express = require('express');
// var router = express.Router();
// const sqlite3 = require('sqlite3').verbose();
// var db = require('../db/PatientManagement.db');



/* GET home page. */
// router.get('/', function(req, res, next) {
//   res.render('index', { title: 'Express' });
// });
// router.get('/', function(req, res) {
//   res.send("name");
// });
// router.get("/getPatients", (req, res) =>{
//   console.log("getpatients:", req.query);
//   res.render("patients", { title: "Patients",
//     res:[]
//   });
// })

module.exports = router;
const express = require("express")
const path = require("path")
var router = express.Router();

//导入模块
var sqlite3 = require("sqlite3").verbose();
//指定数据库文件位置
var db = new sqlite3.Database( path.join(__dirname,"../db/PatientManagement.db") );


router.post("/addSurvey", (req, res) => {
    let json_body = req.body;
    console.log("addSurvey:", json_body.immuno_compromised);
    let insert_sql = `
        INSERT INTO Survey
        (survey_id, last_sync, symptom, immuno_compromised, patient_id) 
        VALUES (?, ?, ?, ?, ?);
    `;
    
    db.run(insert_sql, [
        json_body.survey_id,
        json_body.last_sync,
        json_body.symptom,
        json_body.immuno_compromised,
        json_body.patient_id,
    ], (err) => {
        if (err) {
            console.error("Error executing SQL:", err);
            res.send(err.message);  
        }
        res.redirect('/Survey');
    });
});
router.post("/add", (req, res) => {
    let json_body = req.body;

    let insert_sql = `
        INSERT INTO Patient 
        (patient_id, first_name, last_name, phone, DOB, address, gender) 
        VALUES (?, ?, ?, ?, ?, ?, ?);
    `;
    
    db.run(insert_sql, [
        json_body.patient_id,
        json_body.first_name,
        json_body.last_name,
        json_body.phone,
        json_body.DOB,  
        json_body.address,
        json_body.gender
    ], (err) => {
        if (err) {
            console.error("Error executing SQL:", err);
            res.send(err.message);  
        }
        res.redirect('/Patient');
    });
});


router.get("/Patient",(req,res) =>{
    let sql = "select * from `Patient`where 1=1";
    let params = []
    if(req.query.id){
        sql += " and patient_id like ?";
        params.push(`%${req.query.id}%`);
        }
    if (req.query.number) {

            sql += " and phone like ?"
            params.push(`%${req.query.number}%`)
          }

    db.all(sql,params,(err,rows)=>{
        if(err == null){
            // res.send(rows)
            res.render('patients', { 
              res:rows
            });
            
        }else{
            res.send(err)
        }
    })

})
router.get("/Survey",(req,res) =>{
    let sql = "select * from `Survey`where 1=1";
    let params = []
    if(req.query.Id){
        sql += " and survey_id like ?";
        params.push(`%${req.query.Id}%`);
        }
    if (req.query.foreignId) {

            sql += " and patient_id like ?"
            params.push(`%${req.query.foreignId}%`)
          }

    db.all(sql,params,(err,rows)=>{
        if(err == null){
            // res.send(rows)
            res.render('survey', { 
              res:rows
            });
            
        }else{
            res.send(err)
        }
    })

})
router.get("/delete",(req,res) =>{
    // receive 
    let sql = "delete from `Patient` where patient_id = ?";
    let params = [req.query.id]
    db.run(sql,params,(err)=>{
        if(err == null){
            res.json({
                delstatus :1
            })
        }
    })
})
router.get("/delSurvey",(req,res) =>{
    // receive 
    let sql = "delete from `Survey` where survey_id = ?";
    let params = [req.query.id]
    db.run(sql,params,(err)=>{
        if(err == null){
            res.json({
                delstatus :1
            })
        }
    })
})

router.get("/editPage", (req, res) => {
  let sql = "select * from `Patient` where patient_id = ?"
  let params = [req.query.patient_id]
  db.all(sql,params,(err,rows)=>{
      if(err == null){
          res.render("editPage", { 
            patientObj:{
                patient_id:rows[0].patient_id,
                first_name:rows[0].first_name,
                last_name:rows[0].last_name,
                phone:rows[0].phone,
                DOB :rows[0].DOB,
                address :rows[0].address,
                gender:rows[0].gender,                 
            }
          });
      }else{
          res.send(err)
      }
  })

})
router.get("/editSurvey", (req, res) => {
    let sql = "select * from `Survey` where survey_id = ?"
    let params = [req.query.survey_id]
    db.all(sql,params,(err,rows)=>{
        if(err == null){
            res.render("editSurvey", { 
                surveyObj:{
                    survey_id:rows[0].survey_id,
                    last_sync: rows[0].last_sync,
                    symptom: rows[0].symptom,
                    immuno_compromised: rows[0].immuno_compromised,
                    patient_id:rows[0].patient_id,
                   
              }
            });
        }else{
            res.send(err)
        }
    })
  
  })
router.post("/updatePatient", (req, res) => {
    console.log(req.body.patient_id)
    let sql =`update Patient set
  first_name ='${req.body.first_name}',
  last_name='${req.body.last_name}',
  phone='${req.body.phone}',
  DOB='${req.body.DOB}',
  address='${req.body.address}',
  gender='${req.body.gender}'
  where patient_id = ${req.body.patient_id}
  `;
    db.run(sql,[],(err)=>{
        console.log("update success")
        if(err == null){
            console.log("update success")
            res.redirect('/Patient')
        }else{
            res.send(err)
        }
    })
})
router.post("/updateSurvey", (req, res) => {
    console.log(req.body.immuno_compromised)
    let sql =`update Survey set
  survey_id='${req.body.survey_id}',
  last_sync='${req.body.last_sync}',
  symptom='${req.body.symptom}',
  immuno_compromised='${req.body.immuno_compromised}',
  patient_id='${req.body.patient_id}'
  where survey_id = ${req.body.survey_id}
  `;
    db.run(sql,[],(err)=>{
        console.log("update success")
        if(err == null){
            console.log("update success")
            res.redirect('/Survey')
        }else{
            res.send(err)
        }
    })
})


module.exports = router;
