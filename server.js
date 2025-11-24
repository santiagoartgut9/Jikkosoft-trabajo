// =============================
// 📌 CONFIGURACIÓN DE LOGGING
// =============================
const morgan = require('morgan');
const express = require("express");
const app = express();

// Morgan: logs detallados hacia stdout (capturados por CloudWatch / awslogs)
app.use(morgan('combined'));

// Morgan adicional más legible para debugging local
app.use(morgan('dev'));


// =============================
// 📌 CONFIGURACIÓN EXPRESS
// =============================
const port = process.env.PORT || 3000;

// Servir archivos estáticos desde /public
app.use(express.static("public"));


// =============================
// 📌 ENDPOINT DE SALUD
// =============================
app.get('/health', (req, res) => {
    res.status(200).json({
        status: 'OK',
        message: 'Servidor funcionando correctamente',
        timestamp: new Date().toISOString()
    });
});


// =============================
// 📌 LEVANTAR SERVIDOR
// =============================
app.listen(port, () => {
    console.log(`Servidor corriendo en http://localhost:${port}`);
});
