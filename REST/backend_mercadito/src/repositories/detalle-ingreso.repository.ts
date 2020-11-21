import {DefaultCrudRepository} from '@loopback/repository';
import {DetalleIngreso, DetalleIngresoRelations} from '../models';
import {ConeccionDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class DetalleIngresoRepository extends DefaultCrudRepository<
  DetalleIngreso,
  typeof DetalleIngreso.prototype.iddetalleIngreso,
  DetalleIngresoRelations
> {
  constructor(
    @inject('datasources.Coneccion') dataSource: ConeccionDataSource,
  ) {
    super(DetalleIngreso, dataSource);
  }
}
