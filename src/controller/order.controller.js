const { validationResult } = require("express-validator")


const createOrderController = (serviceOrder) => {

    const _get = (req, res) => {

    }
    const _post = (req, res) => {

        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(422).json({ errors: errors.array() });
        } else {
            try {
                serviceOrder.save(req.body)
                res.status(201)
                res.send({ message: "Recurso criado com sucesso!"})
            } catch (error) {
                res.status(412)
                res.send({ erro: err.detail })            
            }
        }
    }
    return {
        get: _get,
        post: _post
    }

}

module.exports = createOrderController