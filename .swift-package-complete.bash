#!/bin/bash

_swift() {
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    COMPREPLY=()
    opts="-h --help run build test package help"
    if [[ $COMP_CWORD == "1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case ${COMP_WORDS[1]} in
        (run)
            _swift_run 2
            return
            ;;
        (build)
            _swift_build 2
            return
            ;;
        (test)
            _swift_test 2
            return
            ;;
        (package)
            _swift_package 2
            return
            ;;
        (help)
            _swift_help 2
            return
            ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_run() {
    opts="--package-path --cache-path --config-path --security-path --scratch-path --pkg-config-path --enable-dependency-cache --disable-dependency-cache --enable-build-manifest-caching --disable-build-manifest-caching --manifest-cache --verbose -v --very-verbose --vv --disable-sandbox --netrc --enable-netrc --disable-netrc --netrc-file --enable-keychain --disable-keychain --resolver-fingerprint-checking --enable-prefetching --disable-prefetching --force-resolved-versions --disable-automatic-resolution --only-use-versions-from-resolved-file --skip-update --disable-scm-to-registry-transformation --use-registry-identity-for-scm --replace-scm-with-registry --configuration -c -Xcc -Xswiftc -Xlinker -Xcxx --triple --sdk --toolchain --sanitize --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --jobs -j --emit-swift-module-separately --use-integrated-swift-driver --explicit-target-dependency-import-check --experimental-explicit-module-build --build-system --enable-dead-strip --disable-dead-strip --static-swift-stdlib --no-static-swift-stdlib --repl --debugger --run --skip-build --build-tests --version -help -h --help"
    opts="$opts $(swift package completion-tool list-executables)"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_build() {
    opts="--package-path --cache-path --config-path --security-path --scratch-path --pkg-config-path --enable-dependency-cache --disable-dependency-cache --enable-build-manifest-caching --disable-build-manifest-caching --manifest-cache --verbose -v --very-verbose --vv --disable-sandbox --netrc --enable-netrc --disable-netrc --netrc-file --enable-keychain --disable-keychain --resolver-fingerprint-checking --enable-prefetching --disable-prefetching --force-resolved-versions --disable-automatic-resolution --only-use-versions-from-resolved-file --skip-update --disable-scm-to-registry-transformation --use-registry-identity-for-scm --replace-scm-with-registry --configuration -c -Xcc -Xswiftc -Xlinker -Xcxx --triple --sdk --toolchain --sanitize --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --jobs -j --emit-swift-module-separately --use-integrated-swift-driver --explicit-target-dependency-import-check --experimental-explicit-module-build --build-system --enable-dead-strip --disable-dead-strip --static-swift-stdlib --no-static-swift-stdlib --build-tests --show-bin-path --print-manifest-job-graph --target --product --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --target)
            
            return
        ;;
        --product)
            
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_test() {
    opts="--package-path --cache-path --config-path --security-path --scratch-path --pkg-config-path --enable-dependency-cache --disable-dependency-cache --enable-build-manifest-caching --disable-build-manifest-caching --manifest-cache --verbose -v --very-verbose --vv --disable-sandbox --netrc --enable-netrc --disable-netrc --netrc-file --enable-keychain --disable-keychain --resolver-fingerprint-checking --enable-prefetching --disable-prefetching --force-resolved-versions --disable-automatic-resolution --only-use-versions-from-resolved-file --skip-update --disable-scm-to-registry-transformation --use-registry-identity-for-scm --replace-scm-with-registry --configuration -c -Xcc -Xswiftc -Xlinker -Xcxx --triple --sdk --toolchain --sanitize --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --jobs -j --emit-swift-module-separately --use-integrated-swift-driver --explicit-target-dependency-import-check --experimental-explicit-module-build --build-system --enable-dead-strip --disable-dead-strip --static-swift-stdlib --no-static-swift-stdlib --skip-build --test-product --parallel --num-workers --list-tests -l --show-codecov-path --show-code-coverage-path --show-coverage-path -s --specifier --filter --skip --xunit-output --enable-testable-imports --disable-testable-imports --enable-code-coverage --disable-code-coverage --version -help -h --help list generate-linuxmain"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --test-product)
            
            return
        ;;
        --num-workers)
            
            return
        ;;
        -s|--specifier)
            
            return
        ;;
        --filter)
            
            return
        ;;
        --skip)
            
            return
        ;;
        --xunit-output)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
    esac
    case ${COMP_WORDS[$1]} in
        (list)
            _swift_test_list $(($1+1))
            return
            ;;
        (generate-linuxmain)
            _swift_test_generate-linuxmain $(($1+1))
            return
            ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_test_list() {
    opts="--skip-build --test-product --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --test-product)
            
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_test_generate-linuxmain() {
    opts="--version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package() {
    opts="--package-path --cache-path --config-path --security-path --scratch-path --pkg-config-path --enable-dependency-cache --disable-dependency-cache --enable-build-manifest-caching --disable-build-manifest-caching --manifest-cache --verbose -v --very-verbose --vv --disable-sandbox --netrc --enable-netrc --disable-netrc --netrc-file --enable-keychain --disable-keychain --resolver-fingerprint-checking --enable-prefetching --disable-prefetching --force-resolved-versions --disable-automatic-resolution --only-use-versions-from-resolved-file --skip-update --disable-scm-to-registry-transformation --use-registry-identity-for-scm --replace-scm-with-registry --configuration -c -Xcc -Xswiftc -Xlinker -Xcxx --triple --sdk --toolchain --sanitize --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --jobs -j --emit-swift-module-separately --use-integrated-swift-driver --explicit-target-dependency-import-check --experimental-explicit-module-build --build-system --enable-dead-strip --disable-dead-strip --static-swift-stdlib --no-static-swift-stdlib --version -help -h --help clean purge-cache reset update describe init _format diagnose-api-breaking-changes experimental-api-diff dump-symbol-graph dump-pif dump-package edit unedit config resolve fetch show-dependencies tools-version compute-checksum archive-source completion-tool plugin default-command"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
    esac
    case ${COMP_WORDS[$1]} in
        (clean)
            _swift_package_clean $(($1+1))
            return
            ;;
        (purge-cache)
            _swift_package_purge-cache $(($1+1))
            return
            ;;
        (reset)
            _swift_package_reset $(($1+1))
            return
            ;;
        (update)
            _swift_package_update $(($1+1))
            return
            ;;
        (describe)
            _swift_package_describe $(($1+1))
            return
            ;;
        (init)
            _swift_package_init $(($1+1))
            return
            ;;
        (_format)
            _swift_package__format $(($1+1))
            return
            ;;
        (diagnose-api-breaking-changes)
            _swift_package_diagnose-api-breaking-changes $(($1+1))
            return
            ;;
        (experimental-api-diff)
            _swift_package_experimental-api-diff $(($1+1))
            return
            ;;
        (dump-symbol-graph)
            _swift_package_dump-symbol-graph $(($1+1))
            return
            ;;
        (dump-pif)
            _swift_package_dump-pif $(($1+1))
            return
            ;;
        (dump-package)
            _swift_package_dump-package $(($1+1))
            return
            ;;
        (edit)
            _swift_package_edit $(($1+1))
            return
            ;;
        (unedit)
            _swift_package_unedit $(($1+1))
            return
            ;;
        (config)
            _swift_package_config $(($1+1))
            return
            ;;
        (resolve)
            _swift_package_resolve $(($1+1))
            return
            ;;
        (fetch)
            _swift_package_fetch $(($1+1))
            return
            ;;
        (show-dependencies)
            _swift_package_show-dependencies $(($1+1))
            return
            ;;
        (tools-version)
            _swift_package_tools-version $(($1+1))
            return
            ;;
        (compute-checksum)
            _swift_package_compute-checksum $(($1+1))
            return
            ;;
        (archive-source)
            _swift_package_archive-source $(($1+1))
            return
            ;;
        (completion-tool)
            _swift_package_completion-tool $(($1+1))
            return
            ;;
        (plugin)
            _swift_package_plugin $(($1+1))
            return
            ;;
        (default-command)
            _swift_package_default-command $(($1+1))
            return
            ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_clean() {
    opts="--version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_purge-cache() {
    opts="--version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_reset() {
    opts="--version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_update() {
    opts="--dry-run -n --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_describe() {
    opts="--type --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --type)
            
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_init() {
    opts="--type --name --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --type)
            
            return
        ;;
        --name)
            
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package__format() {
    opts="--version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_diagnose-api-breaking-changes() {
    opts="--breakage-allowlist-path --products --targets --baseline-dir --regenerate-baseline --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --breakage-allowlist-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --products)
            
            return
        ;;
        --targets)
            
            return
        ;;
        --baseline-dir)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_experimental-api-diff() {
    opts="--version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_dump-symbol-graph() {
    opts="--pretty-print --skip-synthesized-members --minimum-access-level --skip-inherited-docs --include-spi-symbols --emit-extension-block-symbols --omit-extension-block-symbols --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --minimum-access-level)
            COMPREPLY=( $(compgen -W "private fileprivate internal public open" -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_dump-pif() {
    opts="--preserve-structure --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_dump-package() {
    opts="--version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_edit() {
    opts="--revision --branch --path --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --revision)
            
            return
        ;;
        --branch)
            
            return
        ;;
        --path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_unedit() {
    opts="--force --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_config() {
    opts="--version -help -h --help set-mirror unset-mirror get-mirror"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case ${COMP_WORDS[$1]} in
        (set-mirror)
            _swift_package_config_set-mirror $(($1+1))
            return
            ;;
        (unset-mirror)
            _swift_package_config_unset-mirror $(($1+1))
            return
            ;;
        (get-mirror)
            _swift_package_config_get-mirror $(($1+1))
            return
            ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_config_set-mirror() {
    opts="--package-url --original-url --mirror-url --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --package-url)
            
            return
        ;;
        --original-url)
            
            return
        ;;
        --mirror-url)
            
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_config_unset-mirror() {
    opts="--package-url --original-url --mirror-url --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --package-url)
            
            return
        ;;
        --original-url)
            
            return
        ;;
        --mirror-url)
            
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_config_get-mirror() {
    opts="--package-url --original-url --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --package-url)
            
            return
        ;;
        --original-url)
            
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_resolve() {
    opts="--version --branch --revision --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --version)
            
            return
        ;;
        --branch)
            
            return
        ;;
        --revision)
            
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_fetch() {
    opts="--version --branch --revision --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --version)
            
            return
        ;;
        --branch)
            
            return
        ;;
        --revision)
            
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_show-dependencies() {
    opts="--format --output-path -o --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --format)
            
            return
        ;;
        --output-path|-o)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_tools-version() {
    opts="--set-current --set --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --set)
            
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_compute-checksum() {
    opts="--version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_archive-source() {
    opts="-o --output --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        -o|--output)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_completion-tool() {
    opts="--version -help -h --help"
    opts="$opts generate-bash-script generate-zsh-script generate-fish-script list-dependencies list-executables list-snippets"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_plugin() {
    opts="--list --allow-writing-to-package-directory --allow-writing-to-directory --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --allow-writing-to-directory)
            
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_default-command() {
    opts="--allow-writing-to-package-directory --allow-writing-to-directory --version -help -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --security-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --scratch-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --pkg-config-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --resolver-fingerprint-checking)
            
            return
        ;;
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        -Xcc)
            
            return
        ;;
        -Xswiftc)
            
            return
        ;;
        -Xlinker)
            
            return
        ;;
        -Xcxx)
            
            return
        ;;
        --triple)
            
            return
        ;;
        --sdk)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --toolchain)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --sanitize)
            
            return
        ;;
        --jobs|-j)
            
            return
        ;;
        --explicit-target-dependency-import-check)
            
            return
        ;;
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --allow-writing-to-directory)
            
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_help() {
    opts=""
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}


complete -F _swift swift
