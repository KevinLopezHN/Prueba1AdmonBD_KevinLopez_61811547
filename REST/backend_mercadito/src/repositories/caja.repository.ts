import {DefaultCrudRepository} from '@loopback/repository';
import {Caja, CajaRelations} from '../models';
import {ConeccionDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class CajaRepository extends DefaultCrudRepository<
  Caja,
  typeof Caja.prototype.idCaja,
  CajaRelations
> {
  constructor(
    @inject('datasources.Coneccion') dataSource: ConeccionDataSource,
  ) {
    super(Caja, dataSource);
  }
}
