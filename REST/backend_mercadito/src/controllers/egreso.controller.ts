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
import {Egreso} from '../models';
import {EgresoRepository} from '../repositories';

export class EgresoController {
  constructor(
    @repository(EgresoRepository)
    public egresoRepository : EgresoRepository,
  ) {}

  @post('/egresos', {
    responses: {
      '200': {
        description: 'Egreso model instance',
        content: {'application/json': {schema: getModelSchemaRef(Egreso)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Egreso, {
            title: 'NewEgreso',
            
          }),
        },
      },
    })
    egreso: Egreso,
  ): Promise<Egreso> {
    return this.egresoRepository.create(egreso);
  }

  @get('/egresos/count', {
    responses: {
      '200': {
        description: 'Egreso model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Egreso) where?: Where<Egreso>,
  ): Promise<Count> {
    return this.egresoRepository.count(where);
  }

  @get('/egresos', {
    responses: {
      '200': {
        description: 'Array of Egreso model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Egreso, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Egreso) filter?: Filter<Egreso>,
  ): Promise<Egreso[]> {
    return this.egresoRepository.find(filter);
  }

  @patch('/egresos', {
    responses: {
      '200': {
        description: 'Egreso PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Egreso, {partial: true}),
        },
      },
    })
    egreso: Egreso,
    @param.where(Egreso) where?: Where<Egreso>,
  ): Promise<Count> {
    return this.egresoRepository.updateAll(egreso, where);
  }

  @get('/egresos/{id}', {
    responses: {
      '200': {
        description: 'Egreso model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Egreso, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Egreso, {exclude: 'where'}) filter?: FilterExcludingWhere<Egreso>
  ): Promise<Egreso> {
    return this.egresoRepository.findById(id, filter);
  }

  @patch('/egresos/{id}', {
    responses: {
      '204': {
        description: 'Egreso PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Egreso, {partial: true}),
        },
      },
    })
    egreso: Egreso,
  ): Promise<void> {
    await this.egresoRepository.updateById(id, egreso);
  }

  @put('/egresos/{id}', {
    responses: {
      '204': {
        description: 'Egreso PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() egreso: Egreso,
  ): Promise<void> {
    await this.egresoRepository.replaceById(id, egreso);
  }

  @del('/egresos/{id}', {
    responses: {
      '204': {
        description: 'Egreso DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.egresoRepository.deleteById(id);
  }
}
