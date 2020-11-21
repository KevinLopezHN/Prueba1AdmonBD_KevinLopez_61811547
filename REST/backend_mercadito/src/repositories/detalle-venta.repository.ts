import {DefaultCrudRepository} from '@loopback/repository';
import {DetalleVenta, DetalleVentaRelations} from '../models';
import {ConeccionDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class DetalleVentaRepository extends DefaultCrudRepository<
  DetalleVenta,
  typeof DetalleVenta.prototype.iddetalleVenta,
  DetalleVentaRelations
> {
  constructor(
    @inject('datasources.Coneccion') dataSource: ConeccionDataSource,
  ) {
    super(DetalleVenta, dataSource);
  }
}
