const Psicologos = require('../models/Psicologos')
const bcrypt = require('bcryptjs')

//Listar todos Psicologos
const psicologosController = {
  listarPsicologos: async (req, res) => {
    try {
      const listaPsicologos = await Psicologos.findAll()
      res.status(200).json(listaPsicologos)
    } catch (error) {
      console.log(error)
      res.status(404).json({ error })
    }
  },

  //Listar Psicologos por ID
  async listarPsicologosId(req, res) {
    try {
      const { id } = req.params
      const listaDePsicologos = await Psicologos.findAll({
        where: {
          id
        }
      })

      if (!listaDePsicologos) {
        return res.status(404).json('Id não encontrado')
      } else {
        res.status(200).json(listaDePsicologos)
      }
    } catch (error) {
      res.status(404).json({ error })
    }
  },

  //Cadastrar Psicologos
  async cadastrarPsicologos(req, res) {
    try {
      const { nome, email, senha, apresentacao } = req.body
      const newSenha = bcrypt.hashSync(senha, 10)
      const novoPsicologo = await Psicologos.create({
        nome,
        email,
        senha: newSenha,
        apresentacao
      })

      if (!novoPsicologo) {
        res.status(400).json('Houve um erro na requisição.')
      } else {
        res.status(201).json(novoPsicologo)
      }
    } catch (error) {
      res.status(400).json({ error })
    }
  },

  //Atualizar Psicologos
  async atualizarPsicologos(req, res) {
    const { id } = req.params
    const { nome, email, senha, apresentacao } = req.body

    if (!id) return res.status(400).json('Erro na solicitação')

    const newSenha = bcrypt.hashSync(senha, 10)

    const psicologoAtualizado = await Psicologos.update(
      {
        nome,
        email,
        senha: newSenha,
        apresentacao
      },
      {
        where: {
          id
        }
      }
    )
    res.status(201).json('Psicologo Atualizado')
  },

  // Deletando Psicologos
  async deletarPsicologos(req, res) {
    try {
      const { id } = req.params
      const deletandoPsicologo = await Psicologos.destroy({
        where: {
          id
        }
      })
      if (!deletandoPsicologo) {
        res.status(404).json('Id não encontrado')
      } else {
        res.sendStatus(204)
      }
    } catch (error) {
      return res.status(400).json({ error })
    }
  }
}

module.exports = psicologosController
