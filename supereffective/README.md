#  SuperEffective App

## App connection to the pokeapi.co, search for a pokemon's typing that is supereffective against a selected type

## Features

### Steps, 
1. connect to API, get types.
2. show types
3. allow users to select a type. <single>
4. search API for all pokemon who's types are Super Effective against that type.
5. display the pokemon as name entries.


### use clean swift, and tests, test using snapshot testing and viewinspector.

## Depencies 
1. snapshot
2. viewInspector
3. factory


## Discovery

### Factory, [on github](https://github.com/hmlongco/Factory)

on the HRMC App we use the predecessor [Resolver](https://github.com/hmlongco/Resolver), the start of a new project, the chance to learn something new.

create the first service by extending the `Container` a factory defined object. I create a FactoryContainer to that will be responsible for registering my dependency objects.

1. PokeApiGetService, this is a network request service that fetches the types from the PokeApi.co
2. PokemonDataTypeCache, this is a cache of the types previously requested and saved to userDefaults

## Unit Testing

## Improvements

### UI for the Pokemon Modules

Only pokemon types were address for the spoc, further user experince could be made by allowing the user to search the actual pokemon a give type has an advantage or disadvantage against. 
 
### Mocking factory components

This wasn't addressed in this SPOC 
