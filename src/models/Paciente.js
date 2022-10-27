const db = require('../database/db')
const { DataTypes } = require('sequelize')

const Paciente = db.define('paciente', {
  id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    allowNull: false,
    primaryKey: true
  },
  nome: {
    type: DataTypes.STRING,
    allowNull: false
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false
  },
  idade: {
    type: DataTypes.INTEGER,
    allowNull: false
  }
})

// Paciente.sync()

module.exports = Paciente
