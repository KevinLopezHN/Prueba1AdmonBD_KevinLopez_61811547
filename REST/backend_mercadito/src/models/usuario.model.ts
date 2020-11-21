import {Entity, model, property} from '@loopback/repository';

@model({settings: {idInjection: false, mssql: {schema: 'dbo', table: 'usuario'}}})
export class Usuario extends Entity {
  @property({
    type: 'number',
    required: false,
    precision: 10,
    scale: 0,
    id: 1,
    mssql: {columnName: 'idusuario', dataType: 'int', dataLength: null, dataPrecision: 10, dataScale: 0, nullable: 'YES'},
  })
  idusuario?: number;

  @property({
    type: 'number',
    required: true,
    precision: 10,
    scale: 0,
    mssql: {columnName: 'idrol', dataType: 'int', dataLength: null, dataPrecision: 10, dataScale: 0, nullable: 'NO'},
  })
  idrol: number;

  @property({
    type: 'string',
    required: true,
    length: 100,
    mssql: {columnName: 'nombre', dataType: 'varchar', dataLength: 100, dataPrecision: null, dataScale: null, nullable: 'NO'},
  })
  nombre: string;

  @property({
    type: 'string',
    length: 20,
    mssql: {columnName: 'tipo_documento', dataType: 'varchar', dataLength: 20, dataPrecision: null, dataScale: null, nullable: 'YES'},
  })
  tipoDocumento?: string;

  @property({
    type: 'string',
    length: 20,
    mssql: {columnName: 'num_documento', dataType: 'varchar', dataLength: 20, dataPrecision: null, dataScale: null, nullable: 'YES'},
  })
  numDocumento?: string;

  @property({
    type: 'string',
    length: 70,
    mssql: {columnName: 'direccion', dataType: 'varchar', dataLength: 70, dataPrecision: null, dataScale: null, nullable: 'YES'},
  })
  direccion?: string;

  @property({
    type: 'string',
    length: 20,
    mssql: {columnName: 'telefono', dataType: 'varchar', dataLength: 20, dataPrecision: null, dataScale: null, nullable: 'YES'},
  })
  telefono?: string;

  @property({
    type: 'string',
    required: true,
    length: 50,
    mssql: {columnName: 'email', dataType: 'varchar', dataLength: 50, dataPrecision: null, dataScale: null, nullable: 'NO'},
  })
  email: string;

  @property({
    type: 'string',
    required: true,
    length: 50,
    mssql: {columnName: 'password', dataType: 'varchar', dataLength: 50, dataPrecision: null, dataScale: null, nullable: 'NO'},
  })
  password: string;

  @property({
    type: 'boolean',
    mssql: {columnName: 'estado', dataType: 'bit', dataLength: null, dataPrecision: null, dataScale: null, nullable: 'YES'},
  })
  estado?: boolean;

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<Usuario>) {
    super(data);
  }
}

export interface UsuarioRelations {
  // describe navigational properties here
}

export type UsuarioWithRelations = Usuario & UsuarioRelations;
