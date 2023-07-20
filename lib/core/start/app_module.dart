import 'package:curso_flutter_unipampa/app/data/repositories/get_github_user_by_name/get_github_user_by_name_imp_repository.dart';
import 'package:curso_flutter_unipampa/app/data/repositories/get_github_user_list/get_github_user_list_imp_repository.dart';
import 'package:curso_flutter_unipampa/app/domain/usecases/get_github_user_by_name/get_github_user_by_name_imp_usecase.dart';
import 'package:curso_flutter_unipampa/app/domain/usecases/get_github_user_list/get_github_user_list_imp_usecase.dart';
import 'package:curso_flutter_unipampa/app/external/datasources/get_github_user_by_name/get_github_user_by_name_imp_datasource.dart';
import 'package:curso_flutter_unipampa/app/external/datasources/get_github_user_list/get_github_user_list_imp_datasource.dart';
import 'package:curso_flutter_unipampa/app/presentation/pages/user_github/user_details/user_details_page.dart';
import 'package:curso_flutter_unipampa/app/presentation/pages/user_github/user_details/user_details_page_controller.dart';
import 'package:curso_flutter_unipampa/app/presentation/pages/user_github/user_github_page.dart';
import 'package:curso_flutter_unipampa/app/presentation/pages/user_github/user_github_page_controller.dart';
import 'package:curso_flutter_unipampa/core/services/client_http/client_https.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        //usecases
        $GetGithubUserListImpUsecase,
        $GetGithubUserByNameImpUsecase,

        //repositories
        $GetGithubUserListImpRepository,
        $GetGithubUserByNameImpRepository,

        //datasources
        $GetGithubUserListImpDatasource,
        $GetGithubUserByNameImpDatasource,

        //controllers
        $ClientHttps,
        $UserGithubPageController,
        $UserDetailsPageController,
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const UserGithubList()),
        ChildRoute(
          '/details',
          child: (context, args) => UserDetailsPage(
            user: args.data['user'],
          ),
        ),
      ];
}
