create schema tienda
create table tienda.tipo_documento(
	id int4 not null,
	sigla varchar(10) not null,
	nombre_documento varchar(50) not null,
	constraint uk_nombre_documento unique (nombre_documento),
	constraint pk_tipo_documento primary key(id)
);

create table tienda.rol(
	id int4 not null,
	tipo varchar(20)not null,
	descripcion varchar(255)not null,
	constraint pk_rol primary key (id),
	constraint uk_tipo unique (tipo)
);

create table tienda.usuario(
	id int4 not null,
	numero_documento int4 not null,
	email varchar(100) not null,
	password varchar(50)not null,
	telefono varchar(10) not null,
	direccion varchar(50)not null,
	primer_nombre varchar(50)not null,
	segundo_nombre varchar(50)null,
	primer_apellido varchar(50)not null,
	segundo_apellido varchar(50)null,
	rolcodigo_rol serial not null,
	tipo_documentoid int4 not null,
	constraint uk_email unique (email),
	constraint uk_numero_documento unique (numero_documento),
	constraint pk_usuario primary key(id, tipo_documentoid),
	constraint fk_usu_tip_doc foreign key (tipo_documentoid)references tienda.tipo_documento(id),
	constraint fk_rol_usuario foreign key(rolcodigo_rol)references tienda.rol(id)
);

create table tienda.productos(
	id int4 not null,
	nombre_producto varchar (200) not  null,
	precio numeric not null,
	descripcion varchar (255)not null,
	url_image varchar(500) not null,
	codigo_producto varchar (50) not null,
	constraint uk_codigo_producto unique (codigo_producto),
	constraint uk_nombre_producto unique (nombre_producto),
	constraint pk_productos primary key (id)
);

create table tienda.tipo_pago(
	id int4 not null,
	estado BOOLEAN not null,
	tipo_pago varchar (20) not null,
	constraint uk_tipo_pago unique (tipo_pago),
	constraint pk_tipo_pago primary key (id)
);

create table tienda.pedido(
	id int4 not null,
	codigo_pedido varchar (50) not null,
	cantidad_producto int4 not null,
	fecha date not null,
	numero_documento int4 not null,
	productosid int4 not null,
	usuarioid int4 not null,
	usuariotipo_documentoid int4 not null,
	constraint uk_codigo_pedido unique (codigo_pedido),
	constraint pk_pedido primary key (id),
	constraint fk_usua_pedi foreign key(usuarioid, usuariotipo_documentoid)references tienda.usuario(id, tipo_documentoid),
	constraint fk_pro_pedi_productos foreign key(productosid) references tienda.productos (id)
);

create table tienda.factura(
	id int4 not null,
	codigo_factura varchar (50) not null,
	numeracion varchar (6) not null,
	iva varchar(4) not null,
	total_pagar numeric not null,
	detalles varchar (400) not null,
	usuarioid int4 not null,
	usuariotipo_documentoid int4 not null,
	pedidoid int4 not null,
	tiendatipo_pagoid int4 not null,
	constraint pk_factura primary key (id),
	constraint uk_codigo_factura unique (codigo_factura),
	constraint uk_numeracion unique (numeracion),
	constraint fk_usua_factu foreign key(usuarioid, usuariotipo_documentoid)references tienda.usuario(id, tipo_documentoid),
	constraint fk_ped_fac foreign key (pedidoid)references tienda.pedido(id),
	constraint fk_tipo_pago_factu foreign key (tiendatipo_pagoid)references tienda.tipo_pago(id)
);

create schema adopcion

create table adopcion.mascota(
	id int4 not null,
	identificacion int4 not null,
	raza varchar(50)not null,
	edad int4 not null,
	meses_años varchar(10) not null,
	sexo varchar(50)not null,
	fecha_entrada date not null,
	estado_mascota varchar(50)not null,
	constraint uk_identificacion unique (identificacion),
	constraint pk_mascota primary key (id)

);
create table adopcion.formulario_adopcion(
	id int4 not null,
	codigo_formulario int4 not null,
	justificacion varchar (255) not null,
	usuarioid int4 not null,
	usuariotipo_documentoid int4 not null,
	mascotaid int4 not null,
	constraint uk_codigo_formulario unique (codigo_formulario),
	constraint pk_formulario_adopcion primary key (id),
	constraint fk_form_adop_usu foreign key(usuarioid, usuariotipo_documentoid)references tienda.usuario(id, tipo_documentoid),
	constraint fk_form_adop_masc foreign key (mascotaid)references adopcion.mascota(id)
);

create table adopcion.respuesta_adopcion(
	id int4 not null,
	respuesta_adopcion varchar(256)not null,
	formulario_adopcionid int4 not null,
	constraint uk_respuesta_adopcion unique (respuesta_adopcion),
	constraint pk_respuesta_adopcion primary key (id),
	constraint fk_resp_adop_for_adop foreign key (formulario_adopcionid) references adopcion.formulario_adopcion(id)
);


INSERT INTO tienda.rol (id,tipo,descripcion)
VALUES ('1','administrador_pagina','administra las tiendas que entran a la pagina');
INSERT INTO tienda.rol (id,tipo,descripcion)
VALUES ('2','administrador_tienda','administra su tienda sacando y ingresando productos');
INSERT INTO tienda.rol (id,tipo,descripcion)
VALUES ('3','empleados','lleva un control del inventario,organiza y saca productos');
INSERT INTO tienda.rol (id,tipo,descripcion)
VALUES ('4','cliente','hace la compra de los productos en mostrario');
INSERT INTO tienda.rol (id,tipo,descripcion)
VALUES ('5','cliente2','puede hacer la adopcion de alguno de los animales en mostrario');



INSERT INTO tienda.tipo_documento (id,sigla,nombre_documento)
VALUES ('1','cc','cedula ciudadania');
INSERT INTO tienda.tipo_documento (id,sigla,nombre_documento)
VALUES ('2','TI','Tarjeta identidad');
INSERT INTO tienda.tipo_documento (id,sigla,nombre_documento)
VALUES ('3','CE','cedula extrangeria');
INSERT INTO tienda.tipo_documento (id,sigla,nombre_documento)
VALUES ('4','pep','Persona expuesta políticamente');
INSERT INTO tienda.tipo_documento (id,sigla,nombre_documento)
VALUES ('5','PEP-RAMV','Persona temporal en el pais');



INSERT INTO tienda.usuario (id,numero_documento,email,password,telefono,direccion,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,rolcodigo_rol,tipo_documentoid)
VALUES ('1','1012316434','coronadoc744@gmail.com','1234','3118812790','calle73 c sur#77 L09','CARLOS','SANTIAGO','CORONADO','RUBIO','1','2');
INSERT INTO tienda.usuario (id,numero_documento,email,password,telefono,direccion,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,rolcodigo_rol,tipo_documentoid)
VALUES ('2','1025140590','bshorta0@misena.edu.co','1234','3188501952','bosa porvenir','BRAYAN',' STEVEN','HORTA ','QUEVEDO','2','2');
INSERT INTO tienda.usuario (id,numero_documento,email,password,telefono,direccion,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,rolcodigo_rol,tipo_documentoid)
VALUES ('3','1012320675','Yjagamez57@misena.edu.co','1234','3002755704','americas','YEHIMY','JULIANA','AGAMEZ','GARCIA','2','2');
INSERT INTO tienda.usuario (id,numero_documento,email,password,telefono,direccion,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,rolcodigo_rol,tipo_documentoid)
VALUES ('4','1000128026 ','cpgarzon62@misena.edu.co','1234','3232464241','muy muy lejano','CLAUDIA','PATRICIA','GARZON','BABATIVA','2','1');
INSERT INTO tienda.usuario (id,numero_documento,email,password,telefono,direccion,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,rolcodigo_rol,tipo_documentoid)
VALUES ('5','1001174023','jcguerrero3204@misena.edu.co','1234','3203564774','kenedy','JUAN','CARLOS','GUERRERO','ARANZAZU','2','1');


insert into tienda.productos (id,nombre_producto,precio,descripcion,url_image,codigo_producto)
values ('1','comida para gatos don kat adulto','41.650','comida especialmente para gatos','https://www.amarilla.co/images/amarilla/products/7764/DSC_7548.jpg','2364891');
insert into tienda.productos (id,nombre_producto,precio,descripcion,url_image,codigo_producto)
values ('2','comida para gatos don kat cachorro','15.330','comida especialmente para gatos','https://mercaldas.vteximg.com.br/arquivos/ids/216708-1000-1000/Alimento-para-gato-DONKAT-gatitos-x500-g_40294.jpg?v=637571257049670000','5826489');
insert into tienda.productos (id,nombre_producto,precio,descripcion,url_image,codigo_producto)
values ('3','comida para perros pedigree de cachorro','43.554','comida especialmente para perros ','https://cdn.shopify.com/s/files/1/0410/2199/7206/products/Pedigree-cachorro_285x.png?v=1596662789','3612574');
insert into tienda.productos (id,nombre_producto,precio,descripcion,url_image,codigo_producto)
values ('4','comida para perros pedigree de adulto','103.092','comida especialmente para perros ','https://lares.com.co/wp-content/uploads/2020/06/ARGEDIT.png','4568265');
insert into tienda.productos (id,nombre_producto,precio,descripcion,url_image,codigo_producto)
values ('5','comida para pajaros mistura','89.012','comida especialmente para pajaros ','https://exitocol.vtexassets.com/arquivos/ids/662681-800-auto?width=800&height=auto&aspect=true','5689213');


insert into tienda.pedido (id,codigo_pedido,cantidad_producto,fecha, numero_documento,productosid,usuarioid,usuariotipo_documentoid)
values ('1','COL000-001','5','2021/06/10','1000128026','2','5','1');
insert into tienda.pedido (id,codigo_pedido,cantidad_producto,fecha, numero_documento,productosid,usuarioid,usuariotipo_documentoid)
values ('2','COL000-002','4','2021/06/15','1012320675','3','2','2');
insert into tienda.pedido (id,codigo_pedido,cantidad_producto,fecha, numero_documento,productosid,usuarioid,usuariotipo_documentoid)
values ('3','COL000-003','3','2021/06/20','1025140590','4','3','2');
insert into tienda.pedido (id,codigo_pedido,cantidad_producto,fecha, numero_documento,productosid,usuarioid,usuariotipo_documentoid)
values ('4','COL000-004','1','2021/06/25','1012316434','1','4','1');
insert into tienda.pedido (id,codigo_pedido,cantidad_producto,fecha, numero_documento,productosid,usuarioid,usuariotipo_documentoid)
values ('5','COL000-005','2','2021/06/30','1001174023','5','1','2');

INSERT INTO tienda.tipo_pago (id,estado,tipo_pago)
VALUES ('1','yes','Codensa'),
('2','yes','Efecty'),
('3','yes','Balotto'),
('4','no','Visa'),
('5','no','Mastercard');

insert into tienda.factura (id,codigo_factura, numeracion,iva, total_pagar, detalles, usuarioid, usuariotipo_documentoid,pedidoid,tiendatipo_pagoid)
values ('1','0000001','21/01','19%','49.563','comida para gatos don kat adulto','4','1','4','1');
insert into tienda.factura (id,codigo_factura, numeracion,iva, total_pagar, detalles, usuarioid, usuariotipo_documentoid,pedidoid,tiendatipo_pagoid)
values ('2','0000002','21/02','19%','91.213','comida para gatos don kat cachorro','5','1','1','2');
insert into tienda.factura (id,codigo_factura, numeracion,iva, total_pagar, detalles, usuarioid, usuariotipo_documentoid,pedidoid,tiendatipo_pagoid)
values ('3','0000003','21/03','19%','182.491','comida para perros pedigree de cachorro','2','2','1','1');
insert into tienda.factura (id,codigo_factura, numeracion,iva, total_pagar, detalles, usuarioid, usuariotipo_documentoid,pedidoid,tiendatipo_pagoid)
values ('4','0000004','21/04','19%','328.863','comida para perros pedigree de adulto','3','2','3','3');
insert into tienda.factura (id,codigo_factura, numeracion,iva, total_pagar, detalles, usuarioid, usuariotipo_documentoid,pedidoid,tiendatipo_pagoid)
values ('5','0000005','21/05','19%','194.936','comida para pajaros mistura','1','2','4','2');

insert into adopcion.mascota (id,identificacion, raza, edad, meses_años, sexo, fecha_entrada, estado_mascota)
values ('1','001','pincher','5','meses','masculino','15/01/2021','bien cuidado');
insert into adopcion.mascota (id,identificacion, raza, edad, meses_años, sexo, fecha_entrada, estado_mascota)
values ('2','002','chihuahua','3','años','masculino','20/03/2019','bien cuidado');
insert into adopcion.mascota (id,identificacion, raza, edad, meses_años, sexo, fecha_entrada, estado_mascota)
values ('3','003','persona','4','meses','masculino','09/03/2021','bien cuidado');
insert into adopcion.mascota (id,identificacion, raza, edad, meses_años, sexo, fecha_entrada, estado_mascota)
values ('4','004','canario','9','meses','femenino','10/02/2019','bien cuidado');
insert into adopcion.mascota (id,identificacion, raza, edad, meses_años, sexo, fecha_entrada, estado_mascota)
values ('5','005','esfinge','2','años','femenino','15/03/2018','bien cuidado');


insert into adopcion.formulario_adopcion (id,codigo_formulario,justificacion,usuarioid,usuariotipo_documentoid,mascotaid)
values ('1','1','Estoy de acuerdo con el diligenciamiento de este formulario con el fin de completar el proceso de adopción','5','1','2');
insert into adopcion.formulario_adopcion (id,codigo_formulario,justificacion,usuarioid,usuariotipo_documentoid,mascotaid)
values ('2','2','Estoy de acuerdo con el diligenciamiento de este formulario con el fin de completar el proceso de adopción','1','2','1');
insert into adopcion.formulario_adopcion (id,codigo_formulario,justificacion,usuarioid,usuariotipo_documentoid,mascotaid)
values ('3','3','Estoy de acuerdo con el diligenciamiento de este formulario con el fin de completar el proceso de adopción','2','2','3');
insert into adopcion.formulario_adopcion (id,codigo_formulario,justificacion,usuarioid,usuariotipo_documentoid,mascotaid)
values ('4','4','Estoy de acuerdo con el diligenciamiento de este formulario con el fin de completar el proceso de adopción','3','2','4');
insert into adopcion.formulario_adopcion (id,codigo_formulario,justificacion,usuarioid,usuariotipo_documentoid,mascotaid)
values ('5','5','Estoy de acuerdo con el diligenciamiento de este formulario con el fin de completar el proceso de adopción','4','1','5');

insert into adopcion.respuesta_adopcion (id,respuesta_adopcion,formulario_adopcionid)
values ('1','fue aceptada su peticion,porque usted cumple los requisitos necesarios para que un buen amigo fiel,recuerde que para nosotros lo mas primordial es el cuidado de ellos','3');
insert into adopcion.respuesta_adopcion (id,respuesta_adopcion,formulario_adopcionid)
values ('2','no fue aceptada su peticion por su bajo interes hacia nuestras mascotas','1');
insert into adopcion.respuesta_adopcion (id,respuesta_adopcion,formulario_adopcionid)
values ('3','felicitaciones su peticion fue aceptada','2');
insert into adopcion.respuesta_adopcion (id,respuesta_adopcion,formulario_adopcionid)
values ('4','su peticion no es valida,no cuenta con requisitos necesarios','5');
insert into adopcion.respuesta_adopcion (id,respuesta_adopcion,formulario_adopcionid)
values ('5','felicitaciones su peticon es valida,cuenta con los requisitos necesarios','4');



-- El usuario desea saber su tipo de documento en la base de datos
SELECT *FROM tienda.usuario tu INNER JOIN tienda.tipo_documento ttp ON tu.id= ttp.id;

-- El usuario desea saber su rol con su tipo de documento
SELECT*FROM tienda.usuario tu INNER JOIN tienda.tipo_documento ttp ON tu.id= ttp.id
INNER JOIN tienda.rol tr ON tr.id = tu.id;

-- El usuario quiere ver su factura
SELECT *FROM tienda.usuario tu INNER JOIN tienda.factura tf ON tu.id= tf.usuarioid;

-- El usuario quiere ver su pedido
SELECT *FROM tienda.usuario tu INNER JOIN tienda.pedido tp ON tu.id= tp.usuarioid;

-- El usuario quiere ver los productos del pedido hecho
SELECT *FROM tienda.usuario tu INNER JOIN tienda.pedido tp ON tu.id= tp.usuarioid
INNER JOIN tienda.productos tpro ON tpro.id = tp.productosid;

-- El usuario con id 4 en la base de datos, desea ver su pedido con el producto detallado
SELECT *FROM tienda.usuario tu INNER JOIN tienda.pedido tp ON tu.id= tp.usuarioid
INNER JOIN tienda.productos tpro ON tpro.id = tp.productosid
WHERE tu.id= 4;

-- El usuario con id 3 en la base de datos, desea ver la respuesta sobre el formulario de adopción
SELECT *FROM tienda.usuario tu INNER JOIN adopcion.formulario_adopcion afa ON tu.id= afa.usuarioid
INNER JOIN adopcion.respuesta_adopcion ara ON ara.id= afa.id
WHERE tu.id= 3;

-- Ver qué dueño le corresponde a la mascota con id 1 en la base de datos
SELECT *FROM adopcion.mascota am INNER JOIN adopcion.formulario_adopcion afa ON am.id= afa.mascotaid
INNER JOIN tienda.usuario tu ON tu.id= afa.id
WHERE am.id= 1;

-- Ver qué producto le corresponde el id 5 en la base de datos relacionado con pedido
SELECT *FROM tienda.productos tpro INNER JOIN tienda.pedido tp ON tpro.id= tp.productosid
WHERE tpro.id=5;

-- El usuario con id 1 en la base de datos quiere confirmar el pago del pedido previo
SELECT *FROM tienda.usuario tu INNER JOIN tienda.factura tf ON tu.id= tf.usuarioid
INNER JOIN tienda.tipo_pago ttpag ON ttpag.id= tf.tiendatipo_pagoid
WHERE tu.id= 1;
