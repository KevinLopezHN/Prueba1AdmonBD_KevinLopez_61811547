import {DefaultCrudRepository} from '@loopback/repository';
import {Articulo, ArticuloRelations} from '../models';
import {ConeccionDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class ArticuloRepository extends DefaultCrudRepository<
  Articulo,
  typeof Articulo.prototype.idarticulo,
  ArticuloRelations
> {
  constructor(
    @inject('datasources.Coneccion') dataSource: ConeccionDataSource,
  ) {
    super(Articulo, dataSource);
  }
}
