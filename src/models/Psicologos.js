const db = require('../database/db')
const { DataTypes } = require('sequelize')

const Psicologos = db.define(
  'Psicologos',
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      autoIncrement: true
    },

    nome: {
      type: DataTypes.STRING,
      allowNull: false
    },

    email: {
      type: DataTypes.STRING,
      allowNull: false
    },

    senha: {
      type: DataTypes.STRING,
      allowNull: false
    },

    apresentacao: {
      type: DataTypes.STRING,
      allowNull: false
    }
  },
  {
    tableName: 'psicologo'
  }
)

module.exports = Psicologos
