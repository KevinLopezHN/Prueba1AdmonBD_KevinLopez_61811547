import {DefaultCrudRepository} from '@loopback/repository';
import {Ingreso, IngresoRelations} from '../models';
import {ConeccionDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class IngresoRepository extends DefaultCrudRepository<
  Ingreso,
  typeof Ingreso.prototype.idingreso,
  IngresoRelations
> {
  constructor(
    @inject('datasources.Coneccion') dataSource: ConeccionDataSource,
  ) {
    super(Ingreso, dataSource);
  }
}
