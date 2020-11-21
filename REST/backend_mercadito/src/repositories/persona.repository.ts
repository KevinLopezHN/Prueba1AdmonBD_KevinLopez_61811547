import {DefaultCrudRepository} from '@loopback/repository';
import {Persona, PersonaRelations} from '../models';
import {ConeccionDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class PersonaRepository extends DefaultCrudRepository<
  Persona,
  typeof Persona.prototype.idpersona,
  PersonaRelations
> {
  constructor(
    @inject('datasources.Coneccion') dataSource: ConeccionDataSource,
  ) {
    super(Persona, dataSource);
  }
}
