#compdef _operator-sdk operator-sdk


function _operator-sdk {
  local -a commands

  _arguments -C \
    '--verbose[Enable verbose logging]' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "bundle:Manage operator bundle metadata"
      "cleanup:Clean up an Operator deployed with the 'run' subcommand"
      "completion:Generators for shell completions"
      "create:Scaffold a Kubernetes API or webhook"
      "generate:Invokes a specific generator"
      "help:Help about any command"
      "init:Initialize a new project"
      "olm:Manage the Operator Lifecycle Manager installation in your cluster"
      "run:Run an Operator in a variety of environments"
      "scorecard:Runs scorecard"
      "version:Prints the version of operator-sdk"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  bundle)
    _operator-sdk_bundle
    ;;
  cleanup)
    _operator-sdk_cleanup
    ;;
  completion)
    _operator-sdk_completion
    ;;
  create)
    _operator-sdk_create
    ;;
  generate)
    _operator-sdk_generate
    ;;
  help)
    _operator-sdk_help
    ;;
  init)
    _operator-sdk_init
    ;;
  olm)
    _operator-sdk_olm
    ;;
  run)
    _operator-sdk_run
    ;;
  scorecard)
    _operator-sdk_scorecard
    ;;
  version)
    _operator-sdk_version
    ;;
  esac
}


function _operator-sdk_bundle {
  local -a commands

  _arguments -C \
    '--verbose[Enable verbose logging]' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "validate:Validate an operator bundle"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  validate)
    _operator-sdk_bundle_validate
    ;;
  esac
}

function _operator-sdk_bundle_validate {
  _arguments \
    '(-b --image-builder)'{-b,--image-builder}'[Tool to pull and unpack bundle images. Only used when validating a bundle image. One of: [docker, podman, none]]:' \
    '--verbose[Enable verbose logging]'
}

function _operator-sdk_cleanup {
  _arguments \
    '--kubeconfig[Path to the kubeconfig file to use for CLI requests.]:' \
    '(-n --namespace)'{-n,--namespace}'[If present, namespace scope for this CLI request]:' \
    '--timeout[Time to wait for the command to complete before failing]:' \
    '--verbose[Enable verbose logging]'
}


function _operator-sdk_completion {
  local -a commands

  _arguments -C \
    '--verbose[Enable verbose logging]' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "bash:Generate bash completions"
      "zsh:Generate zsh completions"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  bash)
    _operator-sdk_completion_bash
    ;;
  zsh)
    _operator-sdk_completion_zsh
    ;;
  esac
}

function _operator-sdk_completion_bash {
  _arguments \
    '--verbose[Enable verbose logging]'
}

function _operator-sdk_completion_zsh {
  _arguments \
    '(-h --help)'{-h,--help}'[help for zsh]' \
    '--verbose[Enable verbose logging]'
}


function _operator-sdk_create {
  local -a commands

  _arguments -C \
    '--verbose[Enable verbose logging]' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "api:Scaffold a Kubernetes API"
      "webhook:Scaffold a webhook for an API resource"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  api)
    _operator-sdk_create_api
    ;;
  webhook)
    _operator-sdk_create_webhook
    ;;
  esac
}

function _operator-sdk_create_api {
  _arguments \
    '--controller[if set, generate the controller without prompting the user]' \
    '--force[attempt to create resource even if it already exists]' \
    '--group[resource Group]:' \
    '--kind[resource Kind]:' \
    '--make[if true, run make after generating files]' \
    '--namespaced[resource is namespaced]' \
    '--resource[if set, generate the resource without prompting the user]' \
    '--version[resource Version]:' \
    '--verbose[Enable verbose logging]'
}

function _operator-sdk_create_webhook {
  _arguments \
    '--conversion[if set, scaffold the conversion webhook]' \
    '--defaulting[if set, scaffold the defaulting webhook]' \
    '--group[resource Group]:' \
    '--kind[resource Kind]:' \
    '--programmatic-validation[if set, scaffold the validating webhook]' \
    '--resource[resource Resource]:' \
    '--version[resource Version]:' \
    '--verbose[Enable verbose logging]'
}


function _operator-sdk_generate {
  local -a commands

  _arguments -C \
    '--verbose[Enable verbose logging]' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "bundle:Generates bundle data for the operator"
      "kustomize:Contains subcommands that generate operator-framework kustomize data for the operator"
      "packagemanifests:Generates package manifests data for the operator"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  bundle)
    _operator-sdk_generate_bundle
    ;;
  kustomize)
    _operator-sdk_generate_kustomize
    ;;
  packagemanifests)
    _operator-sdk_generate_packagemanifests
    ;;
  esac
}

function _operator-sdk_generate_bundle {
  _arguments \
    '--channels[A comma-separated list of channels the bundle belongs to]:' \
    '--crds-dir[Root directory for CustomResoureDefinition manifests]:' \
    '--default-channel[The default channel for the bundle]:' \
    '--deploy-dir[Root directory for operator manifests such as Deployments and RBAC, ex. '\''deploy'\''. This directory is different from that passed to --input-dir]:' \
    '--input-dir[Directory to read an existing bundle from. This directory is the parent of your bundle '\''manifests'\'' directory, and different from --deploy-dir]:' \
    '--kustomize-dir[Directory containing kustomize bases and a kustomization.yaml for operator-framework manifests]:' \
    '--manifests[Generate bundle manifests]' \
    '--metadata[Generate bundle metadata and Dockerfile]' \
    '--output-dir[Directory to write the bundle to]:' \
    '--overwrite[Overwrite the bundle'\''s metadata and Dockerfile if they exist]' \
    '(-q --quiet)'{-q,--quiet}'[Run in quiet mode]' \
    '--stdout[Write bundle manifest to stdout]' \
    '(-v --version)'{-v,--version}'[Semantic version of the operator in the generated bundle. Only set if creating a new bundle or upgrading your operator]:' \
    '--verbose[Enable verbose logging]'
}


function _operator-sdk_generate_kustomize {
  local -a commands

  _arguments -C \
    '--verbose[Enable verbose logging]' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "manifests:Generates kustomize bases and a kustomization.yaml for operator-framework manifests"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  manifests)
    _operator-sdk_generate_kustomize_manifests
    ;;
  esac
}

function _operator-sdk_generate_kustomize_manifests {
  _arguments \
    '--apis-dir[Root directory for API type defintions]:' \
    '--input-dir[Directory containing existing kustomize files]:' \
    '--interactive[When set or no kustomize base exists, an interactive command prompt will be presented to accept non-inferrable metadata]' \
    '--output-dir[Directory to write kustomize files]:' \
    '(-q --quiet)'{-q,--quiet}'[Run in quiet mode]' \
    '--verbose[Enable verbose logging]'
}

function _operator-sdk_generate_packagemanifests {
  _arguments \
    '--channel[Channel name for the generated package]:' \
    '--crds-dir[Root directory for CustomResoureDefinition manifests]:' \
    '--default-channel[Use the channel passed to --channel as the package manifest file'\''s default channel]' \
    '--deploy-dir[Root directory for operator manifests such as Deployments and RBAC, ex. '\''deploy'\''. This directory is different from that passed to --input-dir]:' \
    '--from-version[Semantic version of the operator being upgraded from]:' \
    '--input-dir[Directory to read existing package manifests from. This directory is the parent of individual versioned package directories, and different from --deploy-dir]:' \
    '--kustomize-dir[Directory containing kustomize bases and a kustomization.yaml for operator-framework manifests]:' \
    '--output-dir[Directory in which to write package manifests]:' \
    '(-q --quiet)'{-q,--quiet}'[Run in quiet mode]' \
    '--stdout[Write package to stdout]' \
    '--update-objects[Update non-CSV objects in this package, ex. CustomResoureDefinitions, Roles]' \
    '(-v --version)'{-v,--version}'[Semantic version of the packaged operator]:' \
    '--verbose[Enable verbose logging]'
}

function _operator-sdk_help {
  _arguments \
    '--verbose[Enable verbose logging]'
}

function _operator-sdk_init {
  _arguments \
    '--domain[domain for groups]:' \
    '--fetch-deps[ensure dependencies are downloaded]' \
    '--license[license to use to boilerplate, may be one of '\''apache2'\'', '\''none'\'']:' \
    '--owner[owner to add to the copyright]:' \
    '*--plugins[Name and optionally version of the plugin to initialize the project with. Available plugins: ("ansible.sdk.operatorframework.io/v1", "go.kubebuilder.io/v2", "helm.sdk.operatorframework.io/v1")]:' \
    '--project-name[name of this project]:' \
    '--project-version[project version, possible values: ("2", "3-alpha")]:' \
    '--repo[name to use for go module (e.g., github.com/user/repo), defaults to the go package of the current working directory.]:' \
    '--skip-go-version-check[if specified, skip checking the Go version]' \
    '--verbose[Enable verbose logging]'
}


function _operator-sdk_olm {
  local -a commands

  _arguments -C \
    '--verbose[Enable verbose logging]' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "install:Install Operator Lifecycle Manager in your cluster"
      "status:Get the status of the Operator Lifecycle Manager installation in your cluster"
      "uninstall:Uninstall Operator Lifecycle Manager from your cluster"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  install)
    _operator-sdk_olm_install
    ;;
  status)
    _operator-sdk_olm_status
    ;;
  uninstall)
    _operator-sdk_olm_uninstall
    ;;
  esac
}

function _operator-sdk_olm_install {
  _arguments \
    '--timeout[time to wait for the command to complete before failing]:' \
    '--version[version of OLM resources to install]:' \
    '--verbose[Enable verbose logging]'
}

function _operator-sdk_olm_status {
  _arguments \
    '--olm-namespace[namespace where OLM is installed]:' \
    '--timeout[time to wait for the command to complete before failing]:' \
    '--version[version of OLM installed on cluster; if unsetoperator-sdk attempts to auto-discover the version]:' \
    '--verbose[Enable verbose logging]'
}

function _operator-sdk_olm_uninstall {
  _arguments \
    '--olm-namespace[namespace from where OLM is to be uninstalled.]:' \
    '--timeout[time to wait for the command to complete before failing]:' \
    '--version[version of OLM resources to uninstall.]:' \
    '--verbose[Enable verbose logging]'
}


function _operator-sdk_run {
  local -a commands

  _arguments -C \
    '--verbose[Enable verbose logging]' \
    "1: :->cmnds" \
    "*::arg:->args"

  case $state in
  cmnds)
    commands=(
      "packagemanifests:Deploy an Operator in the package manifests format with OLM"
    )
    _describe "command" commands
    ;;
  esac

  case "$words[1]" in
  packagemanifests)
    _operator-sdk_run_packagemanifests
    ;;
  esac
}

function _operator-sdk_run_packagemanifests {
  _arguments \
    '--install-mode[InstallMode to create OperatorGroup with. Format: InstallModeType[=ns1,ns2[, ...]]]:' \
    '--kubeconfig[The file path to kubernetes configuration file. Defaults to location specified by $KUBECONFIG, or to default file rules if not set]:' \
    '--namespace[The namespace where operator resources are created. It must already exist in the cluster]:' \
    '--timeout[Time to wait for the command to complete before failing]:' \
    '--version[Packaged version of the operator to deploy]:' \
    '--verbose[Enable verbose logging]'
}

function _operator-sdk_scorecard {
  _arguments \
    '(-c --config)'{-c,--config}'[path to scorecard config file]:' \
    '--kubeconfig[kubeconfig path]:' \
    '(-L --list)'{-L,--list}'[Option to enable listing which tests are run]' \
    '(-n --namespace)'{-n,--namespace}'[namespace to run the test images in]:' \
    '(-o --output)'{-o,--output}'[Output format for results. Valid values: text, json]:' \
    '(-l --selector)'{-l,--selector}'[label selector to determine which tests are run]:' \
    '(-s --service-account)'{-s,--service-account}'[Service account to use for tests]:' \
    '(-x --skip-cleanup)'{-x,--skip-cleanup}'[Disable resource cleanup after tests are run]' \
    '(-w --wait-time)'{-w,--wait-time}'[seconds to wait for tests to complete. Example: 35s]:' \
    '--verbose[Enable verbose logging]'
}

function _operator-sdk_version {
  _arguments \
    '--verbose[Enable verbose logging]'
}

