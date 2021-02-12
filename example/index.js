const Main = require("./output/Main");

const main = () => Main.main();

if (module.hot) {
	module.hot.accept(() => {
		console.info("代码更新，加载新代码！");
		main();
	});
}

console.info("开始启动应用！")
main();
