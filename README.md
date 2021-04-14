# Welcome to the iOS project 📱

*Please read carefully this documentation before starting to make any change*

## Table of contents
* [Features](#features)
* [Demo](#demo)
* [Modular Design](#modular-design)
* [Design pattern for UI layer](#design-pattern-for-ui-layer)
* [Input-Output pattern for ViewModels](#input-output-pattern-for-viewmodels)
* [Making UI](#making-ui)
* [Coding Guidelines](#coding-guidelines)
* [Testing](#testing)
* [Environment](#environment)
* [Documentation](#documentation)

## Features

## Demo

## Modular Design
To reduce the complexity as the project growths and having good separation of concerns,
this project has been devided into multiple parts, each part has its own responsibility. 
We call them, modules. Those modules are not only separeted conventionally but also configured
to prevent from incorrectly mixing them together. Please take a look 
at the picture below to understand how they are connected.

![Modular Design](/docs/resources/modular_design.jpg)

Using modular design not only helps us to have well code separation but also reduces 
the build time (both clean builds and incremental builds) significantly. Look at the picture 
below for details.

![Modular Design](/docs/resources/modular_design_compile_time.jpg)

Now, let's have a brief explaination about all modules and their responsibilities:

- ___Domain___: Contains business logic & model definition. This module doesn't 
depend on any other modules. The business logic should be defined as pure protocols. 
The detail implmenetation must be done in `Platform`.

- ___Platform___: Contains detail implementation for the `Domain`. Ranging from network communication
to data persistence, this module is where the business logic of the application is implemented.
Do NOT import view related modules here (modules like `UIKit` must NOT be imported in this module).

- ___Scene___: Contains UI implementation for the app. All the user interface modules 
(view, screen, ...) must be implemented here. This module depends on only the `Domain`. 
Do NOT use `Platform` directly here.

- ___Main___: The main module of the application. This module is the composition root for the app. 
It is the PIC for creating screens, initializing view models, injecting dependecies, 
and routing between screens. This module depends on `Scene` and `Platform`.


## Design pattern for UI layer
This application utilizes MVVM-C (MVVM plus the Coordinator) pattern. We are also 
using RxSwift & RxCocoa intensively to implement the MVVM for the UI layer.
So you should get familiar with all of them first.

- The coordinator pattern helps us separate view controllers and the navigation between 
view controllers so that each view controller is completely isolated.

- RxSwift: reactive programming used to control the UI layer. RxSwift is NOT allowed 
in any other modules except the `Scene` module where the user interface is managed.

- `ViewController`s: setup & manage views and that's all.
- `ViewModel`s: acts the middle layer between the view controller and services (from `Platform`).
`ViewModel`s receive UI events from `ViewController`s, parse them, call proper actions on services
and then response to the ViewController to update views. `ViewController`s depend on `ViewModel`s.
Services that the `ViewModel`s depend on are injected when creating the ViewController-ViewModel
instances within the main module.

## Input-Output pattern for ViewModels
As explained above, `ViewModels` are preaty much like outputing data based on input events.
To make life a little bit easier, for both reading side and implementing side, we use Input-Output
pattern for all the `ViewModels`.

Input-Out pattern is very simple. To adopt this pattern, all you need to do is making your view model
conforms to this protocol.

```Swift
protocol ViewModelType {
  associatedtype Input
  associatedtype Output

  func transform(_ input: Input) -> Output
}
```

Then, when setting up binding in view controller, all you need to do is passing 
necessary input data and getting output data to control your views.
Please take a look at the `HomeViewModel.swift` and `HomeViewController.swift` for details.

Please refer to this page if you have no idea about what I've mentioned above.
Coordinator pattern: https://khanlou.com/2015/10/coordinators-redux/


## Making UI
Storyboard and Xibs are great but they are not friendly for code review. 
That's the reason interface builder tools like Storyboards and Xibs are not allowed in this project.

You have to create all of you views by code.


## Coding Guidelines
We are following the coding guidelines defined by Google here: 

https://google.github.io/swift/

Please make sure that you understand all the rules written there before making changes.

Additionally, we are also using SwfitLint to enfoce all the common rules so please make sure that
you don't violate any of them. Always try to solve all the warnings.

***Last but not least, please make sure that you are not leaving any layout constraint warnings.***


## Testing
We use unit testing to ensure the product quality. All the modules below need to be covered by unit tests:
- Platform
- Scene (use unit testing for all of you ViewModels)

When writting unit tests please:
- consider edge cases as much as possible
- don't break the existing tests
- run all the tests before commit

Please check the implemented unit tests in each module above for details.

### How to run tests
Just select the corresponding scheme for the module you want to run  unit tests then press `Cmd + U`.

If you want to run all the tests in the project, select the main scheme and press `Cmd + U`

## Environment
- Xcode 12.5
- Swift 5.4

## Documentation
Refer to the `docs` folder of this project for details about each feature. (Under construction)
