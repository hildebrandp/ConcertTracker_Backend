import { Router } from 'express';
import { get_AllConcertBands, get_ConcertBand_ById, create_ConcertBand, update_ConcertBand_ById } from '../controllers/concertBands';
import { get_AllConcertEvents, get_ConcertEvent_ById, create_ConcertEvent, update_ConcertEvent_ById } from '../controllers/concertEvents';
import { get_AllConcertParticipants, get_ConcertParticipant_ById, create_ConcertParticipant, update_ConcertParticipant_ById } from '../controllers/concertParticipants';
import { get_AllConcertVenues, get_ConcertVenue_ById, create_ConcertVenue, update_ConcertVenue_ById } from '../controllers/concertVenues';
import { get_AllEventBands, get_EventBand_ById, create_EventBand, update_EventBand_ById } from '../controllers/eventBands';
import { get_AllEventParticipants, get_EventParticipant_ById, create_EventParticipant, update_EventParticipant_ById } from '../controllers/eventParticipants';

const router = Router();

// API routes for Concert-Bands
router.get('/concertBands', get_AllConcertBands);
router.get('/concertBands/:id', get_ConcertBand_ById);
router.post('/concertBands/', create_ConcertBand);
router.put('/concertBands/:id', update_ConcertBand_ById);

// API routes for Concert-Events
router.get('/concertEvents', get_AllConcertEvents);
router.get('/concertEvents/:id', get_ConcertEvent_ById);
router.post('/concertEvents/', create_ConcertEvent);
router.put('/concertEvents/:id', update_ConcertEvent_ById);

// API routes for Concert-Participants
router.get('/concertParticipants', get_AllConcertParticipants);
router.get('/concertParticipants/:id', get_ConcertParticipant_ById);
router.post('/concertParticipants/', create_ConcertParticipant);
router.put('/concertParticipants/:id', update_ConcertParticipant_ById);

// API routes for Concert-Venues
router.get('/concertVenues', get_AllConcertVenues);
router.get('/concertVenues/:id', get_ConcertVenue_ById);
router.post('/concertVenues/', create_ConcertVenue);
router.put('/concertVenues/:id', update_ConcertVenue_ById);

// API routes for Event-Bands
router.get('/eventBands', get_AllEventBands);
router.get('/eventBands/:id', get_EventBand_ById);
router.post('/eventBands/', create_EventBand);
router.put('/eventBands/:id', update_EventBand_ById);

// API routes for Event-Participants
router.get('/eventParticipants', get_AllEventParticipants);
router.get('/eventParticipants/:id', get_EventParticipant_ById);
router.post('/eventParticipants/', create_EventParticipant);
router.put('/eventParticipants/:id', update_EventParticipant_ById);

export default router;