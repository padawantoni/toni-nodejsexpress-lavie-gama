const Psicologo = require('./Psicologos')
const Paciente = require('./Paciente')
const Atendimentos = require('./Atendimento')

Atendimentos.belongsTo(Psicologo, {
  foreignKey: 'psicologo_id'
})

Atendimentos.belongsTo(Paciente, {
  foreignKey: 'paciente_id'
})

Psicologo.hasMany(Atendimentos, {
  foreignKey: 'psicologo_id'
})

Paciente.hasMany(Atendimentos, {
  foreignKey: 'paciente_id'
})

module.exports = {
  Psicologo,
  Paciente,
  Atendimentos
}
