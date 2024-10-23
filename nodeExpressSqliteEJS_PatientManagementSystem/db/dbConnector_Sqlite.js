const sqlite3 = require("sqlite3");
const { open } = require("sqlite");

// 获取患者列表（带分页和模糊查询）
async function getPatients(query, page, pageSize) {
  console.log("getPatients", query);

  const db = await open({
    filename: "./db/PatientManagement.db",
    driver: sqlite3.Database,
  });

  const stmt = await db.prepare(`
    SELECT * FROM Patient
    WHERE first_name LIKE @query OR last_name LIKE @query
    ORDER BY patient_id ASC
    LIMIT @pageSize
    OFFSET @offset;
  `);

  const params = {
    "@query": query + "%",
    "@pageSize": pageSize,
    "@offset": (page - 1) * pageSize,
  };

  try {
    return await stmt.all(params);
  } finally {
    await stmt.finalize();
    db.close();
  }
}

// 获取符合条件的患者总数
async function getPatientsCount(query) {
  console.log("getPatientsCount", query);

  const db = await open({
    filename: "./db/PatientManagement.db",
    driver: sqlite3.Database,
  });

  const stmt = await db.prepare(`
    SELECT COUNT(*) AS count
    FROM Patient
    WHERE first_name LIKE @query OR last_name LIKE @query;
  `);

  const params = {
    "@query": query + "%",
  };

  try {
    return (await stmt.get(params)).count;
  } finally {
    await stmt.finalize();
    db.close();
  }
}

// 根据 ID 获取患者信息
async function getPatientByID(patient_id) {
  console.log("getPatientByID", patient_id);

  const db = await open({
    filename: "./db/PatientManagement.db",
    driver: sqlite3.Database,
  });

  const stmt = await db.prepare(`
    SELECT * FROM Patient
    WHERE patient_id = @patient_id;
  `);

  const params = {
    "@patient_id": patient_id,
  };

  try {
    return await stmt.get(params);
  } finally {
    await stmt.finalize();
    db.close();
  }
}

// 根据 ID 更新患者信息
async function updatePatientByID(patient_id, patient) {
  console.log("updatePatientByID", patient_id, patient);

  const db = await open({
    filename: "./db/PatientManagement.db",
    driver: sqlite3.Database,
  });

  const stmt = await db.prepare(`
    UPDATE Patient
    SET
      first_name = @first_name,
      last_name = @last_name,
      phone = @phone,
      DOB = @DOB,
      address = @address,
      gender = @gender
    WHERE
      patient_id = @patient_id;
  `);

  const params = {
    "@patient_id": patient_id,
    "@first_name": patient.first_name,
    "@last_name": patient.last_name,
    "@phone": patient.phone,
    "@DOB": patient.DOB,
    "@address": patient.address,
    "@gender": patient.gender,
  };

  try {
    return await stmt.run(params);
  } finally {
    await stmt.finalize();
    db.close();
  }
}

// 根据 ID 删除患者
async function deletePatientByID(patient_id) {
  console.log("deletePatientByID", patient_id);

  const db = await open({
    filename: "./db/PatientManagement.db",
    driver: sqlite3.Database,
  });

  const stmt = await db.prepare(`
    DELETE FROM Patient
    WHERE patient_id = @patient_id;
  `);

  const params = {
    "@patient_id": patient_id,
  };

  try {
    return await stmt.run(params);
  } finally {
    await stmt.finalize();
    db.close();
  }
}

// 插入新的患者记录
async function insertPatient(patient) {
  console.log("insertPatient", patient);

  const db = await open({
    filename: "./db/PatientManagement.db",
    driver: sqlite3.Database,
  });

  const stmt = await db.prepare(`INSERT INTO
    Patient(first_name, last_name, phone, DOB, address, gender)
    VALUES (@first_name, @last_name, @phone, @DOB, @address, @gender);`);

  const params = {
    "@first_name": patient.first_name,
    "@last_name": patient.last_name,
    "@phone": patient.phone,
    "@DOB": patient.DOB,
    "@address": patient.address,
    "@gender": patient.gender,
  };

  try {
    return await stmt.run(params);
  } finally {
    await stmt.finalize();
    db.close();
  }
}

module.exports = {
  getPatients,
  getPatientsCount,
  getPatientByID,
  updatePatientByID,
  deletePatientByID,
  insertPatient,
};

