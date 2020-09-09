//Import modules
const express = require('express'); 
const app = express();  

//Serve static files for publishing 
app.use(express.static(__dirname+"/site"))


//Create server
app.listen(8080, () => console.log("server up"));

//Redirect links
app.get('/', (req,res) => { res.sendFile(__dirname+"/html/index.html") ; }); 

app.get('/register', (req,res) => { res.sendFile(__dirname+"/html/register.html"); }); 

app.get('/myCart', (req,res) => { res.sendFile(__dirname+"/html/myCart.html"); }); 

app.get('/userLogin', (req,res) => { res.sendFile(__dirname+"/html/userLogin.html"); }); 

app.get('/productDetail', (req,res) => { res.sendFile(__dirname+"/html/productDetail.html"); }); 

// app.get('/miscompras', (req,res) => { res.sendFile(__dirname+"/site/miscompras.html"); }); 

// app.get('/tiendasoficiales', (req,res) => { res.sendFile(__dirname+"/site/tiendasoficiales.html"); }); 

// app.get('/vender', (req,res) => { res.sendFile(__dirname+"/site/vender.html"); }); 

// app.post('/registro', (req,res) => { res.sendFile(__dirname+"/site/registro.html"); }); 

app.get('*', (req,res) => { res.status(404).send("La pagina no se ha encontrado.") });