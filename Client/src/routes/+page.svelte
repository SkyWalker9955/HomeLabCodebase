<script lang="ts">
	import axios from 'axios';
	import { onMount } from 'svelte';

	interface WeatherForecast {
		date: string;
		temperatureC: number;
		temperatureF: number;
		summary: string;
	}

	let forecasts: WeatherForecast[] = [];

	onMount(async () => {
		const response = await axios.get<WeatherForecast[]>('http://localhost:5066/weatherforecast');
		forecasts = response.data;
	});
</script>

<h1>Weather Forecast</h1>

{#if forecasts.length}
	<ul>
		{#each forecasts as f}
			<li>{f.date} - {f.temperatureC}&#8451; - {f.summary}</li>
		{/each}
	</ul>
{:else}
	<p>Loading...</p>
{/if}
