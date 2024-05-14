import * as esbuild from 'esbuild'

// TODO
// Only watch if --watch arg is passed.

let envPlugin = {
    name: 'env',
    setup(build) {
      // Intercept import paths called "env" so esbuild doesn't attempt
      // to map them to a file system location. Tag them with the "env-ns"
      // namespace to reserve them for this plugin.
      build.onResolve({ filter: /^env$/ }, args => ({
        path: args.path,
        namespace: 'env-ns',
      }))
  
      // Load paths tagged with the "env-ns" namespace and behave as if
      // they point to a JSON file containing the environment variables.
      build.onLoad({ filter: /.*/, namespace: 'env-ns' }, () => ({
        contents: JSON.stringify(process.env),
        loader: 'json',
      }))
    },
  }

let w = await esbuild.context({
    entryPoints: ['app/javascript/*.*'],
    bundle: true,
    outdir: 'app/assets/builds',
    sourcemap:true,
    format:'esm',
    plugins: [envPlugin],
    // watch: true
 })
 await w.watch()
