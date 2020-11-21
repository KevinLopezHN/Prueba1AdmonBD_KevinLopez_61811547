import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where,
} from '@loopback/repository';
import {
  post,
  param,
  get,
  getModelSchemaRef,
  patch,
  put,
  del,
  requestBody,
} from '@loopback/rest';
import {DetalleIngreso} from '../models';
import {DetalleIngresoRepository} from '../repositories';

export class DetalleIngresoController {
  constructor(
    @repository(DetalleIngresoRepository)
    public detalleIngresoRepository : DetalleIngresoRepository,
  ) {}

  @post('/detalle-ingresos', {
    responses: {
      '200': {
        description: 'DetalleIngreso model instance',
        content: {'application/json': {schema: getModelSchemaRef(DetalleIngreso)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(DetalleIngreso, {
            title: 'NewDetalleIngreso',
            
          }),
        },
      },
    })
    detalleIngreso: DetalleIngreso,
  ): Promise<DetalleIngreso> {
    return this.detalleIngresoRepository.create(detalleIngreso);
  }

  @get('/detalle-ingresos/count', {
    responses: {
      '200': {
        description: 'DetalleIngreso model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(DetalleIngreso) where?: Where<DetalleIngreso>,
  ): Promise<Count> {
    return this.detalleIngresoRepository.count(where);
  }

  @get('/detalle-ingresos', {
    responses: {
      '200': {
        description: 'Array of DetalleIngreso model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(DetalleIngreso, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(DetalleIngreso) filter?: Filter<DetalleIngreso>,
  ): Promise<DetalleIngreso[]> {
    return this.detalleIngresoRepository.find(filter);
  }

  @patch('/detalle-ingresos', {
    responses: {
      '200': {
        description: 'DetalleIngreso PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(DetalleIngreso, {partial: true}),
        },
      },
    })
    detalleIngreso: DetalleIngreso,
    @param.where(DetalleIngreso) where?: Where<DetalleIngreso>,
  ): Promise<Count> {
    return this.detalleIngresoRepository.updateAll(detalleIngreso, where);
  }

  @get('/detalle-ingresos/{id}', {
    responses: {
      '200': {
        description: 'DetalleIngreso model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(DetalleIngreso, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(DetalleIngreso, {exclude: 'where'}) filter?: FilterExcludingWhere<DetalleIngreso>
  ): Promise<DetalleIngreso> {
    return this.detalleIngresoRepository.findById(id, filter);
  }

  @patch('/detalle-ingresos/{id}', {
    responses: {
      '204': {
        description: 'DetalleIngreso PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(DetalleIngreso, {partial: true}),
        },
      },
    })
    detalleIngreso: DetalleIngreso,
  ): Promise<void> {
    await this.detalleIngresoRepository.updateById(id, detalleIngreso);
  }

  @put('/detalle-ingresos/{id}', {
    responses: {
      '204': {
        description: 'DetalleIngreso PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() detalleIngreso: DetalleIngreso,
  ): Promise<void> {
    await this.detalleIngresoRepository.replaceById(id, detalleIngreso);
  }

  @del('/detalle-ingresos/{id}', {
    responses: {
      '204': {
        description: 'DetalleIngreso DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.detalleIngresoRepository.deleteById(id);
  }
}
