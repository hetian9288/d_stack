/*
 * Created with Android Studio.
 * User: linkewen
 * Date: 2020/12/3
 * Time: 17:18
 * target: node节点描述
 */

import 'package:d_stack/d_stack.dart';

class DNodeEntity {
  /// 节点列表
  late List<DNode> nodeList;

  /// 跳转类型
  late String action;

  /// 是否有转场动画
  late bool animated;

  DNodeEntity.fromJson(Map json) {
    if (json["nodes"] != null) {
      final List<DNode> list = <DNode>[];
      (json["nodes"] as List).forEach((element) {
        list.add(DNode.fromJson(element));
      });
      nodeList = list;
      action = json["action"] ?? "";
      animated = json["animated"] ?? true;
    }
  }

  Map toJson() {
    final Map json = Map();
    List<Map> list = <Map>[];
    this.nodeList.forEach((element) {
      list.add(element.toJson());
    });
    json["nodes"] = list;
    json["action"] = this.action;
    json["animated"] = this.animated;
    return json;
  }
}

class DNode {
  /// 页面路由
  late String target;

  /// 跳转类型
  late String action;

  /// 携带参数
  late Map params;

  /// 页面类型
  late PageType pageType;

  /// 是否为homePage
  late bool homePage;

  /// 是否有转场动画
  late bool animated;

  /// 是否为临界节点
  late bool boundary;

  /// 页面唯一id
  late String identifier;

  DNode.fromJson(Map json) {
    target = json["target"];
    action = json["action"];
    params = json["params"];
    homePage = json["homePage"] ?? false;
    animated = json["animated"] ?? true;
    boundary = json["boundary"] ?? false;
    identifier = json["identifier"];
    String pageString = json["pageType"];
    if (pageString.toLowerCase() == "flutter") {
      pageType = PageType.flutter;
    } else if (pageString.toLowerCase() == "native") {
      pageType = PageType.native;
    }
  }

  Map toJson() {
    final Map json = Map();
    json["target"] = this.target;
    json["action"] = this.action;
    json["params"] = this.params;
    json["homePage"] = this.homePage;
    json["boundary"] = this.boundary;
    json["animated"] = this.animated;
    json["identifier"] = this.identifier;
    switch (this.pageType) {
      case PageType.flutter:
        {
          json["pageType"] = "flutter";
          break;
        }
      case PageType.native:
        {
          json["pageType"] = "native";
          break;
        }
    }
    return json;
  }
}
