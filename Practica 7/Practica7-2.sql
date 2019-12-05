use Farmacia_1743923

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

select count(id_usuario) Usuario,id_detalle,sum(cantidad_det_vta) cantidad_de_venta
from Detalle_venta
group by id_detalle
order by Cantidad_de_venta

Select SUM(e.id_sucursal) Empleados_por_Sucursal,s.nombre_suc as Sucursal
from Empleados e
INNER JOIN Sucursales s on e.id_sucursal = s.id_sucursal
group by s.nombre_suc
having sum(e.id_sucursal)>1

select COUNT(id_detalle)Ventas_Usuarios, id_usuario
from Detalle_venta
group by id_usuario
having id_usuario = 1

select COUNT(id_detalle)Ventas_Usuarios, id_usuario
from Detalle_venta
group by id_usuario
having id_usuario = 2

select count(id_producto)Productos_por_Departamento,id_departamento
from Productos  
group by id_departamento

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Select p.nombre_prod, ipr.cantidad,ipr.estado
from Inventario_productos ipr
inner join Productos p on  ipr.id_producto = p.id_producto
where ipr.id_producto = 1

Select e.nombre_epdo, p.Sueldo_pue
from Puesto p
inner join Empleados e on p.puesto_id= e.puesto_id
group by e.nombre_epdo,p.Sueldo_pue
having Sueldo_pue>3000


select Puesto_id,count(id_empleado) Numero_de_Empleados
from Empleados
group by puesto_id
order by puesto_id

select count(id_proveedor) Proveedor,id_compra,fecha_compra
from Orden_compra
group by id_compra,fecha_compra
order by fecha_compra

select count(id_sucursal) Ventas_sucursal,id_venta
from Venta
group by id_venta

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Select e.nombre_epdo,e.ap_pat_epdo,u.usuario
from Empleados e 
inner join Usuarios u on  e.id_empleado = u.id_empleado
where e.id_empleado=2

Select dv.id_detalle, p.nombre_prod,u.usuario, dv.fecha_venta
from Detalle_venta dv
inner join Usuarios u on  dv.id_usuario = u.id_usuario
inner join Venta v on  dv.id_venta = v.id_venta
inner join Productos p on  dv.id_producto = p.id_producto
where dv.id_detalle = 1

Select dv.id_detalle, dv.id_venta, s.nombre_suc
from Detalle_venta dv
inner join Sucursales s on dv.id_sucursal = s.id_sucursal
where dv.id_detalle = 1

Select a.descripcion_alm, s.nombre_suc
from Almacen a
inner join Sucursales s on a.id_sucursal = s.id_sucursal
where a.id_sucursal = 1 


- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Select e.nombre_epdo, p.Nombre_puesto, p.Sueldo_pue
from Empleados e
inner join Puesto p on  e.puesto_id = p.puesto_id
where e.id_empleado = 1

Select pr.nombre_prod,pr.cantidad_prod,c.nombre_clas
from Productos pr
inner join clasificacion c on  pr.id_clasificacion = c.id_clasificacion
where pr.id_producto = 1

Select e.Nombre_epdo, e.ap_pat_epdo, s.nombre_suc
from Empleados e
inner join Sucursales s on  e.id_sucursal = s.id_sucursal
where e.id_sucursal = 1

Select o.id_compra, p.nombre_prov,s.nombre_suc,o.fecha_compra
from Orden_compra o
inner join Proveedores p on o.id_proveedor=p.id_proveedor 
inner join Sucursales s on  o.id_sucursal = s.id_sucursal
where o.id_compra=1

Select  p.nombre_prod,p.marca_prod,d.nombre_dep
from Departamento d
inner join Productos p on  d.id_departamento = p.id_departamento
where d.id_departamento = 1




