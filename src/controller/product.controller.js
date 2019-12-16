const createProductController = (productDao) => {

   const _get = (req, res) => {
        res.send([{ mensagem: "router produto" }])
    }

    return {
        get: _get
    }

}

module.exports = createProductController