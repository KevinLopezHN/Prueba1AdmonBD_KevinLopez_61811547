import {DefaultCrudRepository} from '@loopback/repository';
import {Venta, VentaRelations} from '../models';
import {ConeccionDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class VentaRepository extends DefaultCrudRepository<
  Venta,
  typeof Venta.prototype.idventa,
  VentaRelations
> {
  constructor(
    @inject('datasources.Coneccion') dataSource: ConeccionDataSource,
  ) {
    super(Venta, dataSource);
  }
}
