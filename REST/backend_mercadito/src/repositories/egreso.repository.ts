import {DefaultCrudRepository} from '@loopback/repository';
import {Egreso, EgresoRelations} from '../models';
import {ConeccionDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class EgresoRepository extends DefaultCrudRepository<
  Egreso,
  typeof Egreso.prototype.idEgreso,
  EgresoRelations
> {
  constructor(
    @inject('datasources.Coneccion') dataSource: ConeccionDataSource,
  ) {
    super(Egreso, dataSource);
  }
}
