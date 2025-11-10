import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'service/bloc/bloc.dart';
import 'src/colors/colors.dart';
import 'src/screens/screen_base.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://aszthnomkdimhlpdionn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFzenRobm9ta2RpbWhscGRpb25uIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjIwNDgzMTcsImV4cCI6MjA3NzYyNDMxN30.c0yMq_7BwJCBmRag-xukDlruAPuyFLG_xUu3RF5xm1U',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true),
      home: MultiBlocProvider(
        providers: multiBlocProvider,
        child: Scaffold(
          body: const ScreenBase(),
          backgroundColor: commonColors.background,
        ),
      ),
    );
  }
}

/// TODO
/// 各画面のView作成
/// 左ペインのタブ作成
/// supabaseへのinsert/update実行
/// 認証の理解
