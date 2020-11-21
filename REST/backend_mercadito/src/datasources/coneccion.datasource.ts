import {inject, lifeCycleObserver, LifeCycleObserver} from '@loopback/core';
import {juggler} from '@loopback/repository';

const config = {
  name: 'Coneccion',
  connector: 'mssql',
  url: 'mssql://ingeniero:ingeniero@DESKTOP-TRONBLH/Mercadito',
  host: 'DESKTOP-TRONBLH',
  port: 1433,
  user: 'ingeniero',
  password: 'ingeniero',
  database: 'Mercadito'
};

// Observe application's life cycle to disconnect the datasource when
// application is stopped. This allows the application to be shut down
// gracefully. The `stop()` method is inherited from `juggler.DataSource`.
// Learn more at https://loopback.io/doc/en/lb4/Life-cycle.html
@lifeCycleObserver('datasource')
export class ConeccionDataSource extends juggler.DataSource
  implements LifeCycleObserver {
  static dataSourceName = 'Coneccion';
  static readonly defaultConfig = config;

  constructor(
    @inject('datasources.config.Coneccion', {optional: true})
    dsConfig: object = config,
  ) {
    super(dsConfig);
  }
}
