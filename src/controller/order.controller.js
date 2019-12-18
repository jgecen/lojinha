const { validationResult } = require("express-validator")


const createOrderController = (serviceOrder) => {

    const _put = (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(422).json({ errors: errors.array() });
        } else {
        serviceOrder.updateStatus(req.body)
            .then(data => {
                res.status(201)
                res.send({ message: "Recurso alterado com sucesso!" })

            }).catch(err => {
                res.status(412)
                res.send({ erro: err.detail })

            })
        }
    }
    const _post = (req, res) => {

        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(422).json({ errors: errors.array() });
        } else {

            serviceOrder.save(req.body)
                .then(data => {
                    res.status(201)
                    res.send({ message: "Recurso criado com sucesso!" })

                }).catch(err => {
                    res.status(412)
                    res.send({ erro: err.detail })

                })
        }
    }
    return {
        post: _post,
        put: _put
    }

}

module.exports = createOrderController