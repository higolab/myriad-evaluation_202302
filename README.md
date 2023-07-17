(注) 本リポジトリの一部は[https://github.com/docker-library/openjdk](https://github.com/docker-library/openjdk)を参考にしたものである．
# Myriad評価実験
## [保守性評価実験](./maintanability_exp)
- maintainability_exp
    - main.my：エントリーポイントとなるmyriadファイル
    - images
        - imageFromDebian.my：Debianベースのテンプレート
        - imageFromOracle.my：OracleLinuxベースのテンプレート
        - imageFromSlimDebian.my：Slim-Debianベースのテンプレート
        - imageFromWindows.my：WindiowsSeverベースのテンプレート
        - function.my：各種テンプレート間で共通して使用する関数を集めたmyriadファイル
    - generate.sh：versions.shからデータを取得し，プリプロセッサの実行，Dockerfileの生成を行うシェルスクリプト
    - versions.json：各種Dockerfileに適用するデータを含めたファイル

## [可読性評価実験](./readability_exp)
- readability_exp
    - main.my：エントリーポイントとなるmyriadファイル
    - images
        - imageFromDebian.my：Debianベースのテンプレート
        - imageFromOracle.my：OracleLinuxベースのテンプレート
        - imageFromSlimDebian.my：Slim-Debianベースのテンプレート
        - imageFromWindows.my：WindiowsSeverベースのテンプレート
        - function.my：各種テンプレート間で共通して使用する関数を集めたmyriadファイル
    - generate.sh：プリプロセッサを実行し，Dockerfileを生成するシェルスクリプト

## [ライブラリ評価実験](./library_exp)
- library_exp
    - Dockerfile：被験者が作成する対象となるDockerfile
    - index.html：作成したコンテナが内部で持つhtmlファイル

## [比較対象](./template_processor)
本比較対象は[Docker HubのOpenJDKプロジェクト](https://github.com/docker-library/openjdk/tree/4310f07d73b56b8fe43afac20ce9bc42ee03f11f)を評価用に改変したものである．
- apply-templates.sh：versions.shからデータを取得し，テンプレートファイルへの適用，Dockerfileの生成を行うシェルスクリプト
- Dockerfile-linux.template：Linuxベースのテンプレートファイル
- Dockerfile-windows.template：WindowsServerベースのテンレートファイル
- versions.sh：各種Dockerfileに適用するデータを含めたファイル