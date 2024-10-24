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
const fs = require("fs")
const path = require("path")
var router = express.Router();

//导入模块
var sqlite3 = require("sqlite3").verbose();
//指定数据库文件位置
var db = new sqlite3.Database( path.join(__dirname,"../db/PatientManagement.db") );

router.post("/add",(req,res)=>{
    let json_body = req.body;
    let insert_sql = "INSERT INTO `Patient` (`id`,`name`,`account`,`password`,`create_time`,`balance`) VALUES ( ?, ?, ?, ?, ?, ? );"
    db.run(insert_sql,[json_body.id,json_body.name,json_body.account,json_body.password,'2022',json_body.balance],(err,rows)=>{
        if(err == null){
            res.send("执行成功");
            
        }else{
            res.send(err)
        }
    })
})

router.get("/testlist",(req,res) =>{
    let sql = "select * from `Patient`where 1=1";
    let params = []
    if(req.query.id){
        sql += " and patient_id like ?";
        params.push(`%${req.query.id}%`);
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


module.exports = router;
