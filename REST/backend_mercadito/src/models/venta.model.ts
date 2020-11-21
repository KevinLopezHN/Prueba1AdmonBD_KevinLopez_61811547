import {Entity, model, property} from '@loopback/repository';

@model({settings: {idInjection: false, mssql: {schema: 'dbo', table: 'venta'}}})
export class Venta extends Entity {
  @property({
    type: 'number',
    required: false,
    precision: 10,
    scale: 0,
    id: 1,
    mssql: {columnName: 'idventa', dataType: 'int', dataLength: null, dataPrecision: 10, dataScale: 0, nullable: 'YES'},
  })
  idventa?: number;

  @property({
    type: 'number',
    required: true,
    precision: 10,
    scale: 0,
    mssql: {columnName: 'idcliente', dataType: 'int', dataLength: null, dataPrecision: 10, dataScale: 0, nullable: 'NO'},
  })
  idcliente: number;

  @property({
    type: 'number',
    required: true,
    precision: 10,
    scale: 0,
    mssql: {columnName: 'idusuario', dataType: 'int', dataLength: null, dataPrecision: 10, dataScale: 0, nullable: 'NO'},
  })
  idusuario: number;

  @property({
    type: 'string',
    required: true,
    length: 20,
    mssql: {columnName: 'tipo_comprobante', dataType: 'varchar', dataLength: 20, dataPrecision: null, dataScale: null, nullable: 'NO'},
  })
  tipoComprobante: string;

  @property({
    type: 'string',
    length: 7,
    mssql: {columnName: 'serie_comprobante', dataType: 'varchar', dataLength: 7, dataPrecision: null, dataScale: null, nullable: 'YES'},
  })
  serieComprobante?: string;

  @property({
    type: 'string',
    required: true,
    length: 10,
    mssql: {columnName: 'num_comprobante', dataType: 'varchar', dataLength: 10, dataPrecision: null, dataScale: null, nullable: 'NO'},
  })
  numComprobante: string;

  @property({
    type: 'date',
    required: true,
    mssql: {columnName: 'fecha_hora', dataType: 'datetime', dataLength: null, dataPrecision: null, dataScale: null, nullable: 'NO'},
  })
  fechaHora: string;

  @property({
    type: 'number',
    required: true,
    precision: 4,
    scale: 2,
    mssql: {columnName: 'impuesto', dataType: 'decimal', dataLength: null, dataPrecision: 4, dataScale: 2, nullable: 'NO'},
  })
  impuesto: number;

  @property({
    type: 'number',
    required: true,
    precision: 11,
    scale: 2,
    mssql: {columnName: 'total', dataType: 'decimal', dataLength: null, dataPrecision: 11, dataScale: 2, nullable: 'NO'},
  })
  total: number;

  @property({
    type: 'string',
    required: true,
    length: 20,
    mssql: {columnName: 'estado', dataType: 'varchar', dataLength: 20, dataPrecision: null, dataScale: null, nullable: 'NO'},
  })
  estado: string;

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<Venta>) {
    super(data);
  }
}

export interface VentaRelations {
  // describe navigational properties here
}

export type VentaWithRelations = Venta & VentaRelations;
