#!/usr/bin/env nextflow

// Single Line Comment

/*
* Block
* Comment
*/

// Include - Functions, Processes, Workflows
// include { params } from './13_module/13_module.nf'
// include { params; foo } from './13_module/13_module.nf'
// include { params as par; bar as baz } from './13_module/13_module.nf'
// include {
//     params as par
//     bar as baz 
//     } from './13_module/13_module.nf'

// Parameters
params.message = 'Hello, World!'
println params.message


// Named Workflow
workflow greet{
    take:
    // parameters
    greetings

    main:
    // statements
    message = greetings.map { v -> "$v world!" }

    emit:
    message
}

// Entry Workflow
workflow {
    main:
    greetings = Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola')
    messages = greetings.map { v -> "$v world!" }
    greetings.view { it -> '$it world!' }

    publish:
    messages >> 'messages'
}