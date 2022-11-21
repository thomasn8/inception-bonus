import { makeStyles  } from "@mui/styles";
import { Container } from "@mui/material";
import { Timeline, Content, ContentYear, ContentBody, Description } from '../timeline';

const useStyles = makeStyles((theme: Theme) => ({
	cvComponent: {
		textAlign: 'center',
		marginTop: 100,
		marginLeft: '15%',
		maxWidth: '80%',
	},
}));

function cvBorn() {
	return (
		<Content>
			<ContentYear startYear='1992' />
		</Content>
	)
}

function devSchool() {
	return (
		<Content>
			<ContentYear
				monthType='text'
				startMonth='10'
				startYear='2021'
				endDate={ '...' }
			/>
			<ContentBody title='42 Lausanne'>
				<Description text={ '[+] Joined 42 school !' } />
			</ContentBody>
		</Content>
	)
}

function masterUni() {
	return (
		<Content>
			<ContentYear
				monthType='text'
				startMonth='9'
				startYear='2016'
				endDate='Feb, 2019'
			/>
			<ContentBody title='Master in Social Sciences'>
				<Description text="Lausanne University"	/>
			</ContentBody>
		</Content>
	)
}

function projectManager() {
	return (
		<Content>
			<ContentYear
				monthType='text'
				startMonth='1'
				startYear='2015'
				endDate='Dec, 2018'
			/>
			<ContentBody title='Project Manager'>
				<Description text="Midnight Sion - Ville de Sion"	/>
				<Description text='' optional='organization of socio-cultural activities for adolescents' />
			</ContentBody>
		</Content>
	)
}

function bachelorUni() {
	return (
		<Content>
			<ContentYear
				monthType='text'
				startMonth='9'
				startYear='2013'
				endDate='June, 2016'
			/>
			<ContentBody title='Bachelor in Sport Sciences and Biology'>
				<Description text="Fribourg University"	/>
			</ContentBody>
		</Content>
	)
}

function supplyChain() {
	return (
		<Content>
			<ContentYear
				monthType='text'
				startMonth='8'
				startYear='2010'
				endDate='Aug, 2011'
			/>
			<ContentBody title='Supply chain scheduler'>
				<Description text="Novelis Switzerland - Sierre"	/>
				<Description text='' optional='manufactured aluminum planification' />
			</ContentBody>
		</Content>
	)
}

export function Curriculum() {
	const cls = useStyles();

	return (
		<Container maxWidth='md' className={ cls.cvComponent }>
			<Timeline>
				{ devSchool() }
				{ masterUni() }
				{ projectManager() }
				{ bachelorUni() }
				{ supplyChain() }
				{ cvBorn() }
			</Timeline>
		</Container>
	)
}