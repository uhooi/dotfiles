#!/bin/bash

_swift() {
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    COMPREPLY=()
    opts="run build test package help -h --help"
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
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file --skip-build --build-tests --repl -h --help"
    opts="$opts $(swift package completion-tool list-executables)"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_build() {
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file --build-tests --show-bin-path --target --product -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file --skip-build --parallel --num-workers --list-tests -l --show-codecov-path -s --specifier --filter --skip --xunit-output --test-product -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --test-product)
            
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package() {
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file clean purge-cache reset update describe init _format experimental-api-diff dump-symbol-graph dump-pif dump-package edit unedit config resolve fetch show-dependencies tools-version generate-xcodeproj compute-checksum archive-source completion-tool -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        (generate-xcodeproj)
            _swift_package_generate-xcodeproj $(($1+1))
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
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_clean() {
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_purge-cache() {
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_reset() {
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_update() {
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file --dry-run -n -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_describe() {
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file --type -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --type)
            
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_init() {
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file --type --name -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_experimental-api-diff() {
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file --invert-baseline -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_dump-symbol-graph() {
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_dump-pif() {
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file --preserve-structure -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_dump-package() {
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_edit() {
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file --revision --branch --path -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file --force -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_config() {
    opts="set-mirror unset-mirror get-mirror -h --help"
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
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file --package-url --original-url --mirror-url -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file --package-url --original-url --mirror-url -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file --package-url --original-url -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file --version --branch --revision -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file --version --branch --revision -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file --format -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --format)
            
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_tools-version() {
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file --format --set-current --set -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --format)
            
            return
        ;;
        --set)
            
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_generate-xcodeproj() {
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file --xcconfig-overrides --output --legacy-scheme-generator --watch --skip-extra-files -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --xcconfig-overrides)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --output)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_compute-checksum() {
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_package_archive-source() {
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file -o --output -h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
    opts="-Xcc -Xswiftc -Xlinker -Xcxx --configuration -c --build-path --cache-path --enable-repository-cache --disable-repository-cache --chdir -C --package-path --multiroot-data-file --enable-prefetching --disable-prefetching --verbose -v --disable-sandbox --manifest-cache --destination --triple --sdk --toolchain --static-swift-stdlib --no-static-swift-stdlib --skip-update --sanitize --enable-code-coverage --disable-code-coverage --force-resolved-versions --disable-automatic-resolution --auto-index-store --enable-index-store --disable-index-store --enable-parseable-module-interfaces --trace-resolver --jobs -j --enable-build-manifest-caching --disable-build-manifest-caching --emit-swift-module-separately --use-integrated-swift-driver --experimental-explicit-module-build --print-manifest-job-graph --build-system --netrc --netrc-optional --netrc-file -h --help"
    opts="$opts generate-bash-script generate-zsh-script generate-fish-script list-dependencies list-executables"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    case $prev in
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
        --configuration|-c)
            COMPREPLY=( $(compgen -W "debug release" -- "$cur") )
            return
        ;;
        --build-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --cache-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --chdir|-C)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --package-path)
            COMPREPLY=( $(compgen -d -- "$cur") )
            return
        ;;
        --multiroot-data-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
        --manifest-cache)
            
            return
        ;;
        --destination)
            COMPREPLY=( $(compgen -f -- "$cur") )
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
        --build-system)
            COMPREPLY=( $(compgen -W "native xcode" -- "$cur") )
            return
        ;;
        --netrc-file)
            COMPREPLY=( $(compgen -f -- "$cur") )
            return
        ;;
    esac
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}
_swift_help() {
    opts="-h --help"
    if [[ $COMP_CWORD == "$1" ]]; then
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
        return
    fi
    COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
}


complete -F _swift swift
