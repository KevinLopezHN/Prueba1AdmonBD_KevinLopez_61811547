import {Entity, model, property} from '@loopback/repository';

@model({settings: {idInjection: false, mssql: {schema: 'dbo', table: 'detalle_venta'}}})
export class DetalleVenta extends Entity {
  @property({
    type: 'number',
    required: false,
    precision: 10,
    scale: 0,
    id: 1,
    mssql: {columnName: 'iddetalle_venta', dataType: 'int', dataLength: null, dataPrecision: 10, dataScale: 0, nullable: 'YES'},
  })
  iddetalleVenta?: number;

  @property({
    type: 'number',
    required: true,
    precision: 10,
    scale: 0,
    mssql: {columnName: 'idventa', dataType: 'int', dataLength: null, dataPrecision: 10, dataScale: 0, nullable: 'NO'},
  })
  idventa: number;

  @property({
    type: 'number',
    required: true,
    precision: 10,
    scale: 0,
    mssql: {columnName: 'idarticulo', dataType: 'int', dataLength: null, dataPrecision: 10, dataScale: 0, nullable: 'NO'},
  })
  idarticulo: number;

  @property({
    type: 'number',
    required: true,
    precision: 10,
    scale: 0,
    mssql: {columnName: 'cantidad', dataType: 'int', dataLength: null, dataPrecision: 10, dataScale: 0, nullable: 'NO'},
  })
  cantidad: number;

  @property({
    type: 'number',
    required: true,
    precision: 11,
    scale: 2,
    mssql: {columnName: 'precio', dataType: 'decimal', dataLength: null, dataPrecision: 11, dataScale: 2, nullable: 'NO'},
  })
  precio: number;

  @property({
    type: 'number',
    required: true,
    precision: 11,
    scale: 2,
    mssql: {columnName: 'descuento', dataType: 'decimal', dataLength: null, dataPrecision: 11, dataScale: 2, nullable: 'NO'},
  })
  descuento: number;

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<DetalleVenta>) {
    super(data);
  }
}

export interface DetalleVentaRelations {
  // describe navigational properties here
}

export type DetalleVentaWithRelations = DetalleVenta & DetalleVentaRelations;
