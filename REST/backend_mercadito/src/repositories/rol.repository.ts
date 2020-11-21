import {DefaultCrudRepository} from '@loopback/repository';
import {Rol, RolRelations} from '../models';
import {ConeccionDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class RolRepository extends DefaultCrudRepository<
  Rol,
  typeof Rol.prototype.idrol,
  RolRelations
> {
  constructor(
    @inject('datasources.Coneccion') dataSource: ConeccionDataSource,
  ) {
    super(Rol, dataSource);
  }
}
