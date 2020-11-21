import {DefaultCrudRepository} from '@loopback/repository';
import {Usuario, UsuarioRelations} from '../models';
import {ConeccionDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class UsuarioRepository extends DefaultCrudRepository<
  Usuario,
  typeof Usuario.prototype.idusuario,
  UsuarioRelations
> {
  constructor(
    @inject('datasources.Coneccion') dataSource: ConeccionDataSource,
  ) {
    super(Usuario, dataSource);
  }
}
