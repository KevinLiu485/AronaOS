# ARONA OS
This is the OS for 2024 OS Competition, HIT team **ᕕ(◠ڼ◠)ᕗ旺仔**.  
Based on rCore-Tutorial-v3 ch6(file system) branch, as adding tests to file system is simpler.  
**To clone this repo FULLY(with submodules), run `git clone --recursive https://github.com/KevinLiu485/AronaOS.git`**  
If you forget to clone recursively, run `git submodule init` and `git submodule update` to clone submodule seperately.
# Team members & Tasks (暂定)
- Kevin Liu: Kernel
- 降星驰: IO, Linux src
- lxh: Kernel
# Developing instructions
- DO Write good commit messages
- Use **TDD** (Test-Driven Development): 
  - 首先，编写测试描述功能需求，测试预期失败。
  - 然后，编写初始代码（不用考虑性能和精简）完成功能并使测试通过。可能在过程中会进一步细化功能，增加测试。
  - 最后，重构代码（对于rust，尽量用函数式编程风格），使其更好地符合设计原则，仍然保持测试通过。
- **Test & Document & Code Review** on each branch merging into master.
  - 对于用户暴露的接口，必须有相关完善的user tests。内核内部抽象可选择写test。
  - 根据敏捷开发原则，Code Review大于一切。
# Repository structure
```
AronaOS
|--bootloader
|  \\rustsbi
|--easy-fs, easy-fs-fuse
|  \\简易文件系统, 跑测例更方便
|--os
|  \\Kernel
|--testsuits-for-oskernel(submodule)
|  \\比赛官方测例仓库作为submodule, 有独立git
|--user
   \\rCore用户测例
```
# Developing workflow
- Before developing new module, run `git pull` to make sure that your local repository is up to date.  
- Then run `git checkout -b <new-branch-name>` to create a new branch then checkout it. 
- Run `git push --set-upstream origin <new-branch-name>` to sync this new branch on Github repository, otherwise you will not be able to `git push` and your branch will not be recorded by Github.
- After that, continue developing on your branch until all tests passed. Push your local to Github periodically by run `git push`.
- Finally, merge main with your branch by: 
  - `git pull`.
  - `git checkout master`, otherwise **main** will fall behind your branch.
  - `git merge <your-branch-name>`. You may need to resolve conflicts.
# Coding Style
## Comment instructions
- `//`: 代码行注释  
- `/* ... */`: 代码块注释  
- `///`: API(pub)文档, 建议使用markdown  
- `//!`: crate/ mod文档  
详见 https://course.rs/basic/comment.html  
## Logging instructions
Use logging marcos to replace `println!` everything in kernel!
> e.g. `error!("CPU {} fail to start!", cpu_number);`  

Run `make <rule> LOG=<LOG_LEVEL>` to change logging level.  
Default logging level is `LOG=ERROR`.  
Logging levels are: `ERROR -> WARN -> INFO -> DEBUG -> TRACE`, from brief to verbose.  
When you enable the verbose one, briefer ones are enabled automatically.
Here are logging level rules:
- `println!`: Used when kernel module starts.  
>e.g. logging system starts, kernel memory mapping starts
- `error!`: Used when error happens in kernel and syscall. Enabled in default.
>e.g. hart initialization failure
- `warn!`: *Not scheduled yet*
- `info!`: Used when kernel module prints working status. 
>e.g. memory mapping info, block device loading info.   
- `debug!`: **Feel free to use it when you are debugging your module!**
- `trace!`: Used when syscall is called.
## Kernel testing instructions
Run `make <rule> KTEST=false` to disable feature `kernel_tests`.  
Always wrapp kernel tests in `#[cfg(feature = "kernel_tests")]{ ... }`.  
By default, feature `kernel_tests` is enabled.
## Conditional Compilation
- Add `<your_feature> = []` in `os/Cargo.toml` under `[features]` section.  
- Wrap your code with `#cfg[(feature = "your_feature")]{ ... }`.  
- Modify variable `KERNEL_FEATURES` in `os/Makefile` to conditionally enable your feature.
## Naming instructions
Generally, stay the same with existing name style.
# Git tips
- For a mistaken commit, run `git reset --soft HEAD~1`, it will revert your last commit and preserve your changes.  
- For a brief commit, run `git commit -am 'Commit message'`. `-a` stage all changes and `-m` accepts a brief commit message.
- Make sure that `Cargo.lock` is not included by `.gitignore`, i.e. always track `Cargo.lock`, as `cargo` may break this rule.
> However, `Cargo.lock` can sometimes be a merge conflict
- If you forget to clone submodule recursively, run `git submodule init` and `git submodule update` to clone submodule seperately.
# Makefile args
- `SBI`: To switch between `rustsbi` and `opensbi`, run `make <rule> SBI=<rustsbi/opensbi>`. By default, AronaOS will run on `rustsbi`.
- `LOG`: see [logging instructions](#logging-instructions).
- `KTEST` see [Kernel testing instructions](#kernel-testing-instructions).
# Relative repositories
- 资料仓库：https://github.com/KevinLiu485/OS-Competition-Material/tree/main
# Figure of A.R.O.N.A OS
![A.R.O.N.A](./Arona.png "A.R.O.N.A")
