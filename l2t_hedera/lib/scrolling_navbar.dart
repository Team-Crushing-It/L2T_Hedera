import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth/authentication_flow.dart';

class ScrollingNavbar extends StatefulWidget {
  final List<Widget> children;
  final AppBar appBar;
  final Axis scrollDirection;

  final List<String> headings;

  ScrollingNavbar({
    this.children = const <Widget>[],
    @required this.appBar,
    this.scrollDirection,
    this.headings = const <String>[],
  }) : assert(children != null);

  @override
  _ScrollingNavbarState createState() => _ScrollingNavbarState();
}

class _ScrollingNavbarState extends State<ScrollingNavbar> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    // add listener on the page view
    _controller.addListener(_scrollListener);
    super.initState();
  }

  //Printing the pozish
  _scrollListener() {
    // final _scrollPozish = _controller.position.pixels;
    // print(_scrollPozish);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void navigateTo(int index) {
    // use this to animate to the page
    _controller.animateToPage(
      index,
      curve: Curves.easeOutCubic,
      duration: Duration(seconds: 1),
    );

    // // or this to jump to it without animating
    // _controller.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final out = BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) => state == AuthenticationState.authenticated
          ? Text('Auth')
          : Text('Unauth'),
    );

    return Scaffold(
      appBar: _buildAppBar(out),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.children.length,
        scrollDirection: widget.scrollDirection == null
            ? Axis.vertical
            : widget.scrollDirection,
        controller: _controller,
        itemBuilder: (BuildContext context, int itemIndex) {
          return widget.children[itemIndex];
        },
      ),
    );
  }

  AppBar _buildAppBar(Widget out) {
    return AppBar(
      title: out,
      leading: ElevatedButton(
        onPressed: () => context.read<AuthenticationCubit>().login(),
        child: Text('test auth'),
      ),
      // leading: widget.appBar?.leading,
      automaticallyImplyLeading: widget.appBar?.automaticallyImplyLeading,
      actions: widget.appBar?.actions,
      // actions: [out],
      flexibleSpace: widget.appBar?.flexibleSpace,
      bottom: widget.appBar?.bottom,
      elevation: widget.appBar?.elevation,
      shadowColor: widget.appBar?.shadowColor,
      shape: widget.appBar?.shape,
      backgroundColor: widget.appBar?.backgroundColor,
      foregroundColor: widget.appBar?.foregroundColor,
      brightness: widget.appBar?.brightness,
      iconTheme: widget.appBar?.iconTheme,
      actionsIconTheme: widget.appBar?.actionsIconTheme,
      textTheme: widget.appBar?.textTheme,
      primary: widget.appBar?.primary,
      centerTitle: widget.appBar?.centerTitle,
      excludeHeaderSemantics: widget.appBar?.excludeHeaderSemantics,
      titleSpacing: widget.appBar?.titleSpacing,
      toolbarHeight: widget.appBar?.toolbarHeight,
      toolbarOpacity: widget.appBar?.toolbarOpacity,
      bottomOpacity: widget.appBar?.bottomOpacity,
      leadingWidth: widget.appBar?.leadingWidth,
      backwardsCompatibility: widget.appBar?.backwardsCompatibility,
      toolbarTextStyle: widget.appBar?.toolbarTextStyle,
      titleTextStyle: widget.appBar?.titleTextStyle,
      systemOverlayStyle: widget.appBar?.systemOverlayStyle,
    );
  }
}

class ScrollingNavbar2 extends AppBar {
  Widget build(BuildContext context) {
    return Container();
  }
}
