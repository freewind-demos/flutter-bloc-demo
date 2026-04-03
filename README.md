# Flutter BLoC（flutter_bloc + Cubit）

## 简介

用 `flutter_bloc` 里的 **Cubit** 管理一个整数计数，`BlocProvider` 注入依赖，`BlocBuilder` 按状态刷新界面。比手写 `setState` 更清晰地把「事件/逻辑」和「展示」分开。

## 快速开始

### 环境要求

已安装 Flutter SDK，`flutter doctor` 可用。

### 运行

```bash
flutter pub get
flutter run
```

## 概念讲解

### 第一部分：Cubit 是什么

Cubit 是一类轻量 BLoC：内部持有一个状态值（这里是 `int`），通过方法改变状态并 `emit` 新值。界面只读状态，不直接改内部字段。

```dart
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() => emit(state + 1);
}
```

### 第二部分：Provider 与 Builder

`BlocProvider(create: ...)` 在子树里提供 Cubit；`BlocBuilder` 订阅同一类型的 Cubit，状态变化时重建。`FloatingActionButton` 里用 `context.read<CounterCubit>()` 调用 `increment()`，避免把业务写在 Widget 里。

## 完整示例

完整可运行代码在 `lib/main.dart`：包含 `MaterialApp`、`BlocProvider`、计数文案与加号按钮。

## 注意事项

- Cubit 适合简单状态；更复杂的异步与多事件可再用完整 `Bloc`。
- 若页面较多，可配合 `MultiBlocProvider` 或路由级注入。

## 完整讲解（中文）

BLoC 系列思路可以总结成：**状态集中放、界面只订阅、变更走明确入口**。Cubit 是这条路上的「简装版」：没有复杂事件对象，直接调方法改数字，对入门计数器、开关、筛选条件都很顺手。`BlocBuilder` 帮你记住「什么时候该重画」，避免满屏 `setState` 找不到是谁触发的。等需求变复杂（例如登录流程、分页加载），再升级到带事件的 `Bloc` 或配合其他架构，思路是一脉相承的。
