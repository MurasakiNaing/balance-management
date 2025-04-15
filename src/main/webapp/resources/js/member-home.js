document.addEventListener('DOMContentLoaded', () => {

	am5.ready(() => {
		
		const loadSummary = (url) => {
			fetch(url, {
				method: 'GET',
				headers : {
					'Content-Type' : 'application/json'
				}
			}).then(response => {
				if(!response.ok) {
					console.log(response.json())
					throw new Error(`API Error: ${response.status}`)
				}
				return response.json();
			}).then(data => {
				document.getElementById('incomes').innerText = data.incomes;
				document.getElementById('expenses').innerText = data.expenses;
				document.getElementById('balances').innerText = data.balances;
			})
			.catch(error => {
				console.error('Error Fetching API', error);
			})
		}
		
		const monthlyInput = document.getElementById('monthly');
		const yearlyInput = document.getElementById('yearly')
		
		monthlyInput.addEventListener('click', () => {
			loadSummary(monthlyInput.dataset['summaryUrl']);
		})
		
		yearlyInput.addEventListener('click', () => {
			loadSummary(yearlyInput.dataset['summaryUrl']);
		})
		
		loadSummary(monthlyInput.dataset['summaryUrl'])
		
		loadBalanceChart(balanceData);
		loadPieChart(expensesData, 'expensesChart');
		loadPieChart(incomesData, 'incomesChart');
	})
})


function loadPieChart(data, chartDiv) {
	var root = am5.Root.new(chartDiv);

	// Set themes
	// https://www.amcharts.com/docs/v5/concepts/themes/
	root.setThemes([
		am5themes_Animated.new(root)
	]);

	// Create chart
	// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/
	var chart = root.container.children.push(
		am5percent.PieChart.new(root, {
			endAngle: 270
		})
	);

	// Create series
	// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/#Series
	var series = chart.series.push(
		am5percent.PieSeries.new(root, {
			valueField: "value",
			categoryField: "ledger",
			endAngle: 270
		})
	);

	series.states.create("hidden", {
		endAngle: -90
	});

	series.labels.template.set("forceHidden", true);
	series.ticks.template.set("forceHidden", true);
	
	series.data.setAll(data);
	
	series.appear(1000, 100)
}

function loadBalanceChart(data) {

	const root = am5.Root.new('balanceChart');

	root.setThemes([
		am5themes_Animated.new(root)
	]);

	var chart = root.container.children.push(am5xy.XYChart.new(root, {
		panX: false,
		panY: false,
		paddingLeft: 0,
		wheelX: "panX",
		wheelY: "zoomX",
		layout: root.verticalLayout
	}));

	var legend = chart.children.push(
		am5.Legend.new(root, {
			centerX: am5.p50,
			x: am5.p50
		})
	);

	var xRenderer = am5xy.AxisRendererX.new(root, {
		cellStartLocation: 0.1,
		cellEndLocation: 0.9,
		minorGridEnabled: true
	})

	var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
		categoryField: "date",
		renderer: xRenderer,
		tooltip: am5.Tooltip.new(root, {})
	}));

	xRenderer.grid.template.setAll({
		location: 1
	})

	xAxis.data.setAll(data);

	var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
		renderer: am5xy.AxisRendererY.new(root, {
			strokeOpacity: 0.1
		})
	}));

	function makeSeries(name, fieldName) {
		var series = chart.series.push(am5xy.ColumnSeries.new(root, {
			name: name,
			xAxis: xAxis,
			yAxis: yAxis,
			valueYField: fieldName,
			categoryXField: "date"
		}));

		series.columns.template.setAll({
			tooltipText: "{name}, {categoryX}:{valueY}",
			width: am5.percent(90),
			tooltipY: 0,
			strokeOpacity: 0
		});

		series.data.setAll(data);

		series.appear();

		series.bullets.push(function() {
			return am5.Bullet.new(root, {
				locationY: 0,
				sprite: am5.Label.new(root, {
					text: "{valueY}",
					fill: root.interfaceColors.get("alternativeText"),
					centerY: 0,
					centerX: am5.p50,
					populateText: true
				})
			});
		});

		legend.data.push(series);
	}

	makeSeries("Incomes", "incomes");
	makeSeries("Expenses", "expenses");

	chart.appear(1000, 100);
}

const expensesData = [{
	ledger: "Electrics Fees",
	value: 300
},
{
	ledger: "Phone",
	value: 300
},
{
	ledger: "Internet",
	value: 300
},]

const incomesData = [{
	ledger: "Service Charges",
	value: 300
},
{
	ledger: "Students Fees",
	value: 300
},
{
	ledger: "Online Fees",
	value: 300
},
]

const balanceData = [{
	"date": "2025/03/02",
	"expenses": 20000,
	"incomes": 50000,
}, {
	"date": "2025/03/03",
	"expenses": 15000,
	"incomes": 50000,
}, {
	"date": "2025/03/04",
	"expenses": 25000,
	"incomes": 39000,
}, {
	"date": "2025/03/05",
	"expenses": 10000,
	"incomes": 50000,
}, {
	"date": "2025/03/06",
	"expenses": 20000,
	"incomes": 40000,
}]